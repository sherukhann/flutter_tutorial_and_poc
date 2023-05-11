import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      // body: BlocBuilder<ProductsBloc, ProductsState>(
      //   builder: (context, state) {
      //     if (state is LoadingState) {
      //       // Loading state
      //       return const Center(
      //         child: CircularProgressIndicator.adaptive(),
      //       );
      //     } else if (state is LoadedState) {
      //       // success state
      //       return ListView.builder(
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             leading: Text(state.productsModel[index].id.toString()),
      //             title: Text(state.productsModel[index].title.toString()),
      //             subtitle: Text(
      //                 state.productsModel[index].category.toString()),
      //           );
      //         },
      //         itemCount: state.productsModel.length,
      //       );
      //     } else if (state is ErrorState) {
      //       // error state
      //       return Center(
      //         child: Text(state.errorMsg),
      //       );
      //     } else {
      //       return const Text('SomeThing Went Wrong!');
      //     }
      //   },
      // ),

      // used to show is net is teir or not, for initla loads of app
      // body: BlocListener<ProductsBloc, ProductsState>(
      //   listener: (context, state) {
      //     if (state is LoadedState) {
      //       // VxToast.show(context, msg: 'Velocity x products loaded');
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(
      //           content: Text('Data Loaded'),
      //         ),
      //       );
      //     } else if( state is ErrorState) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         const SnackBar(
      //           content: Text('Data Not Loaded'),
      //         ),
      //       );
      //     }
      //   },
      //   child: const Center(
      //     child: Text('Bloc Listener'),
      //   ),
      // ),

      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is LoadedState) {
            // VxToast.show(context, msg: 'Velocity x products loaded');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Data Loaded'),
              ),
            );
          } else if( state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Data Not Loaded'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            // Loading state
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is LoadedState) {
            // success state
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(state.productsModel[index].id.toString()),
                  title: Text(state.productsModel[index].title.toString()),
                  subtitle: Text(
                      state.productsModel[index].category.toString()),
                );
              },
              itemCount: state.productsModel.length,
            );
          } else if (state is ErrorState) {
            // error state
            return Center(
              child: Text(state.errorMsg),
            );
          } else {
            return const Text('SomeThing Went Wrong!');
          }
        },
      ),

    );
  }
}
