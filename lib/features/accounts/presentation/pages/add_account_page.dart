import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/domain/supported_currency.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/accounts/domain/requests/create_account_request.dart';
import 'package:fintech/features/accounts/presentation/bloc/add_account_bloc.dart';
import 'package:fintech/features/accounts/presentation/bloc/add_account_event.dart';
import 'package:fintech/features/accounts/presentation/bloc/add_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAccountPage extends StatelessWidget {
  const AddAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddAccountBloc>(
      create: (_) => getIt<AddAccountBloc>(),
      child: const AddAccountView(),
    );
  }
}

class AddAccountView extends StatefulWidget {
  const AddAccountView({super.key});

  @override
  State<AddAccountView> createState() => _AddAccountViewState();
}

class _AddAccountViewState extends State<AddAccountView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _initialBalanceController =
      TextEditingController();

  SupportedCurrency _currency = SupportedCurrency.usd;
  String _accountType = 'checking';

  @override
  void dispose() {
    _nameController.dispose();
    _initialBalanceController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    context.read<AddAccountBloc>().add(
          AddAccountSubmitted(
            name: _nameController.text,
            currency: _currency.code,
            accountType: _accountType,
            initialBalance: _initialBalanceController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add account')),
      body: BlocConsumer<AddAccountBloc, AddAccountState>(
        listener: (BuildContext context, AddAccountState state) {
          if (state is AddAccountSuccess) {
            Navigator.of(context).pop(true);
          }
          if (state is AddAccountFailure) {
            _formKey.currentState?.validate();
          }
        },
        builder: (BuildContext context, AddAccountState state) {
          final bool isLoading = state is AddAccountSubmitting;
          final AddAccountBloc bloc = context.read<AddAccountBloc>();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (state is AddAccountFailure &&
                      state.failure is! ValidationFailure) ...<Widget>[
                    MaterialBanner(
                      content: Text(state.failure.message),
                      backgroundColor:
                          Theme.of(context).colorScheme.errorContainer,
                      actions: const <Widget>[SizedBox.shrink()],
                    ),
                    const SizedBox(height: 16),
                  ],
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Account name',
                      prefixIcon: const Icon(Icons.account_balance_outlined),
                      errorText: bloc.fieldErrors['name'],
                    ),
                    textCapitalization: TextCapitalization.words,
                    enabled: !isLoading,
                    validator: CreateAccountRequest.validateNameField,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<SupportedCurrency>(
                    value: _currency,
                    decoration: InputDecoration(
                      labelText: 'Currency',
                      errorText: bloc.fieldErrors['currency'],
                    ),
                    items: SupportedCurrency.valuesForPicker
                        .map(
                          (SupportedCurrency c) =>
                              DropdownMenuItem<SupportedCurrency>(
                            value: c,
                            child: Text(c.code),
                          ),
                        )
                        .toList(),
                    onChanged: isLoading
                        ? null
                        : (SupportedCurrency? value) {
                            if (value != null) {
                              setState(() => _currency = value);
                            }
                          },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _accountType,
                    decoration: InputDecoration(
                      labelText: 'Account type',
                      errorText: bloc.fieldErrors['accountType'],
                    ),
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        value: 'checking',
                        child: Text('Checking'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'savings',
                        child: Text('Savings'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'current',
                        child: Text('Current'),
                      ),
                    ],
                    onChanged: isLoading
                        ? null
                        : (String? value) {
                            if (value != null) {
                              setState(() => _accountType = value);
                            }
                          },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _initialBalanceController,
                    decoration: InputDecoration(
                      labelText: 'Initial balance (optional)',
                      prefixIcon: const Icon(Icons.payments_outlined),
                      errorText: bloc.fieldErrors['initialBalance'],
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,2}'),
                      ),
                    ],
                    enabled: !isLoading,
                    validator: CreateAccountRequest.validateInitialBalanceField,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: isLoading ? null : _submit,
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Add account'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
