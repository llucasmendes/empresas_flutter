import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:empresas_flutter/configs/ui/Cores.dart';
import 'package:empresas_flutter/configs/ui/DimensoesTela.dart';
import 'package:empresas_flutter/configs/ui/Icones.dart';
import 'package:empresas_flutter/configs/ui/Strings.dart';
import 'package:empresas_flutter/features/home/models/empresas_model.dart';
import 'package:empresas_flutter/features/home/screen/bloc/home_cubit.dart';
import 'package:empresas_flutter/features/home/screen/widgets/item_empresa_factory.dart';
import 'package:empresas_flutter/features/home/screen/widgets/top_container.dart';
import 'package:empresas_flutter/injection_container.dart';
import 'package:empresas_flutter/widgets/campo_form/campo_form.dart';
import 'package:empresas_flutter/widgets/custom_loading/custom_loading.dart';
import 'package:empresas_flutter/widgets/error_widgets/erro_api_widget.dart';
import 'package:empresas_flutter/widgets/error_widgets/sem_internet_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _alturaTopContainer = 200.h;
  late HomeScreenCubit cubit;
  ItemEmpresaFactory itemEmpresaFactory = ItemEmpresaFactory();
  TextEditingController _controllerSearch = TextEditingController();

  _alterarAlturaContainer(bool comFoco) {
    setState(() {
      _alturaTopContainer = comFoco ? 50.h : 200.h;
    });
  }

  @override
  void initState() {
    cubit = dependencia<HomeScreenCubit>();
    cubit.buscarEmpresas(
      termoBusca: _controllerSearch.text,
    );
    super.initState();
  }

  _recarregar(BuildContext context, {bool erroAoBuscar = false}) {
    BlocProvider.of<HomeScreenCubit>(context).buscarEmpresas(
        termoBusca: _controllerSearch.text, erroAoBuscar: erroAoBuscar);
  }

  @override
  void dispose() {
    _controllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<HomeScreenCubit, HomeState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopContainer(alturaContainer: _alturaTopContainer),
                    if (state is LoadingState)
                      Expanded(
                        child: Center(
                          child: CustomLoading(),
                        ),
                      ),
                    if (state is DadosCarregadosState)
                      _buildContent(
                        state.empresasModel.enterprises.length,
                        state.empresasModel,
                      ),
                    if (state is NoInternet)
                      SemInternetWidget(
                        aoApertarTentarNovamente: () =>
                            _recarregar(context, erroAoBuscar: true),
                        corIcone: Colors.black,
                        corTexto: Colors.black,
                      ),
                    if (state is ApiReturnError)
                      ErroApiWidget(
                        aoApertarTentarNovamente: () =>
                            _recarregar(context, erroAoBuscar: true),
                        corIcone: Colors.black,
                        corTexto: Colors.black,
                      )
                  ],
                ),
                _buildSearchBar(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(
    int totaisEncontrados,
    EmpresasModel empresasModel,
  ) {
    return Expanded(
      child: SingleChildScrollView(
        child: itemEmpresaFactory.buildItens(empresasModel.enterprises),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return AnimatedPositioned(
      top: _alturaTopContainer - 22.h,
      duration: Duration(milliseconds: 500),
      child: Container(
        width: 375.w,
        child: CampoForm(
          onFocus: (focus) => _alterarAlturaContainer(focus),
          hintText: Strings.pesquisePorEmpresas,
          onChange: (_) => _recarregar(context),
          fillColor: Cores.cinza[100],
          controller: _controllerSearch,
          hintColor: Cores.cinza[200],
          prefixIcon: Container(
            padding: EdgeInsets.all(10.w),
            height: 20.h,
            width: 20.h,
            child: Image.asset(
              IconesAplicacao.iconeLupa,
              color: Cores.cinza[200],
            ),
          ),
        ),
      ),
    );
  }
}
