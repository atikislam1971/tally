
import 'package:tally/app/data/services/firebase_service.dart';
import 'package:tally/app/widgets/customer_list_tile.dart';
import 'package:tally/exports.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFFe5c07b), Color(0xFFd4a55a)])
          ),
        ),
        centerTitle: false,
        title: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQueryUtils.width * .4,
              height: 22,
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: AppColors.WHITE,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Center(
                child: Text('Atik islam',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    color: AppColors.BLACK
                  ),
                ),
              ),

            ),
            SizedBox(height: 5,),
            const Text('স্ট্যান্ডার্ড',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: AppColors.BLACK
            ),
            ),
          ],
        ),
        actions: [
          Column(
            children: [
              SvgPicture.asset(Assets.svg.messageTop, color: AppColors.WHITE, height: 25, width: 25,),
              const Text(
                'ইনবক্স',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: AppColors.WHITE,
                ),
              ),
            ],
          ),
          const SizedBox(width: 15,),
          Column(
            children: [
              SvgPicture.asset(Assets.svg.support, height: 25,width: 25,color: AppColors.WHITE,),
              const Text('হেল্প', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.WHITE),),
              const SizedBox(width: 10,)
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [

            ///Cover photo
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.BLACK.withOpacity(.1),
                    blurRadius: 4,
                  )
                ],
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://www.tallykhata.com/wp-content/uploads/2025/01/Website-Banner-TK-Gold.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15,),

            /// Menu Bar
            GridView.custom(
              padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                childrenDelegate: SliverChildListDelegate(
                  [
                    _menueItem(
                        icon: Assets.svg.businessFilled,
                        color: 0xFF2f722d,
                        title: 'মাল্টি ব্যবসা'
                    ),
                    _menueItem(
                        icon: Assets.svg.stock,
                        color: 0xFF2f722d,
                        title: 'স্টক হিসাব'
                    ),_menueItem(
                        icon: Assets.svg.notes,
                        color: 0xFF2f722d,
                        title: 'ব্যবসার নোট'
                    ), _menueItem(
                        icon: Assets.svg.bell,
                        color: 0xFF2f722d,
                        title: 'গ্রুপ তাগাদা'
                    ),_menueItem(
                        icon: Assets.svg.superQr,
                        color: 0xFF2f722d,
                        title: 'সুপার QR'
                    ),_menueItem(
                        icon: Assets.svg.upload,
                        color: 0xFF2f722d,
                        title: 'ডাটা ব্যাকআপ'
                    ),_menueItem(
                        icon: Assets.svg.cashBox,
                        color: 0xFF2f722d,
                        title: 'ক্যাশবক্স'
                    ),
                  ]
                )
            ),
            const SizedBox(height: 15,),

            /// লেনদেন হিস্টোরি
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('0', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.green),),
                    Text('মোট পাবো', style: TextStyle(fontWeight: FontWeight.w600),)
                  ],
                )),
                const SizedBox(height: 40,child: VerticalDivider()),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('0', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.green),),
                    Text('মোট দেবো', style: TextStyle(fontWeight: FontWeight.w600),)
                  ],
                )),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: 'খোঁজ',
                          prefixIcon: const Icon(Icons.search)
                        ),
                      ),
                )),
                const SizedBox(width: 5,),
                IconButton(onPressed: (){}, icon: SvgPicture.asset(Assets.svg.filter)),
                IconButton(onPressed: (){}, icon: SvgPicture.asset(Assets.svg.download)),
              ],
            ),
            StreamBuilder(
                stream: FirebaseService.to.firestore
                    .collection('customer')
                    .where('created_by_phone',
                    isEqualTo: FirebaseService.to.auth.currentUser!.phoneNumber).snapshots(),

                builder: (context, snapshot){
                  if(snapshot.connectionState ==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(snapshot.hasError){
                    print(snapshot.error);
                    return Text(snapshot.error.toString());
                  }
                  final customers = snapshot.data!.docs
                      .where((user) => user['user_type'] == 'customer')
                      .toList();
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'কাস্টমার ${customers.length} / সাপ্লায়ার ${snapshot.data!.docs.length - customers.length}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'পাবো',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                TextSpan(
                                  text: ' / ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'দেবো',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: snapshot.data!.docs.length,
                        // itemCount: controller.customersOrSuppliers.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return CustomerListTile(
                            person: snapshot.data!.docs[index].data(),
                            // person: controller.customersOrSuppliers[index],
                          );
                        },
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (){
              Get.toNamed(Routes.ADD);
            },
            elevation: 0,
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
            icon: const Icon(Icons.person_add,size: 16, color: Colors.white,),
            label: const Text(
              'নতুন কাস্টমার/সাপ্লায়ার',
              style: TextStyle(
                  color: Colors.white
              ),
            )
        )

    );
  }

  Column _menueItem({
    required String icon,
    required int color,
    required String title,
}) {
    return Column(
            children: [
              SvgPicture.asset(
                icon,
                height: 35,
                width: 35,
                color: Color(color).withOpacity(.8),
              ),
              const SizedBox(height: 2,),
              Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),)
            ],
    );
  }
}




