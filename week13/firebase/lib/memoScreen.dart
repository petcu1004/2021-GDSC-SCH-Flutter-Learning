import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class memoScreen extends StatefulWidget {
  const memoScreen({Key? key}) : super(key: key);

  @override
  _memoScreenState createState() => _memoScreenState();
}

class _memoScreenState extends State<memoScreen> {
  // 텍스트 필드 두개 선언
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

//데이터 호출(컬렉션 이름 맞추기)
  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('memo');

  //==========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter memo'),
      ),

      body: StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: _productss.snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.hasData) {
            //리스트 뷰 생성(스냅샷으로 가져온 데이터 길이만큼)
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                //카드위젯의 형태로 만들어줌
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['price'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          // 수정 버튼
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _createOrUpdate(
                                  documentSnapshot)), // 데이터 정보를 넣어줌
                          // 삭제 버튼
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteProduct(
                                  documentSnapshot.id)), //데이터의 인덱스를 넣어줌
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // 새 데이터 생성(플러스 버튼)
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(), //아무것도 넣어주지 않음,
        child: const Icon(Icons.add),
      ),
    );
  }

  // 새로 데이터를 생성하거나 수정하는 함수
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    //documentSnapshot : 특정 필드에 액세스 하여 내용 추출 가능
    if (documentSnapshot != null) {
      action = 'update';
      //텍스트 필드에서 텍스트 추출
      _nameController.text = documentSnapshot['name'];
      _priceController.text =
          documentSnapshot['price'].toString(); //string으로 변환 후 저장
    }
    //밑에서 올라오는 추가창
    await showModalBottomSheet(
        isScrollControlled: true, //스크롤 컨트롤 : 키보드 올라오면 화면 오버플로우 현상 막기 위함
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // 키보드가 텍스트 필드 가리는 현상 막기 위함 (사이즈 조정)
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType: //키보드 타입을 자동으로 숫자로
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  //거리유지
                  height: 20,
                ),
                ElevatedButton(
                  //비교조건 , 비교조건이 참일때, 비교 조건이 거짓일때 (삼항연산자)
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String? name = _nameController.text;
                    final int? price = int.tryParse(_priceController.text);
                    if (name != null && price != null) {
                      if (action == 'create') {
                        // firestore에 새 데이터 추가
                        await _productss.add({"name": name, "price": price});
                      }

                      if (action == 'update') {
                        // 데이터 수정이면, 기존 데이터 내용 고대로 나타나도록
                        await _productss
                            .doc(documentSnapshot!.id)
                            .update({"name": name, "price": price});
                      }

                      // 텍스트 필드 비워내기
                      _nameController.text = '';
                      _priceController.text = '';

                      // 추가 창 없어지게 하기
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // 데이터 지우는 함수
  Future<void> _deleteProduct(String productId) async {
    await _productss.doc(productId).delete();

    // 스낵바
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('삭제되었습니다.')));
  }
}
