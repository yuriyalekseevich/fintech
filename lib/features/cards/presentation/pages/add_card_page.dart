import 'package:fintech/core/di/injection.dart';
import 'package:fintech/core/domain/supported_currency.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/cards/domain/requests/create_card_request.dart';
import 'package:fintech/features/cards/presentation/bloc/add_card_bloc.dart';
import 'package:fintech/features/cards/presentation/bloc/add_card_event.dart';
import 'package:fintech/features/cards/presentation/bloc/add_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddCardBloc>(
      create: (_) => getIt<AddCardBloc>(),
      child: const AddCardView(),
    );
  }
}

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryMonthController = TextEditingController();
  final TextEditingController _expiryYearController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _holderNameController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  SupportedCurrency _currency = SupportedCurrency.usd;
  String _cardType = 'debit';

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryMonthController.dispose();
    _expiryYearController.dispose();
    _cvvController.dispose();
    _holderNameController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    context.read<AddCardBloc>().add(
          AddCardSubmitted(
            cardNumber: _cardNumberController.text,
            expiryMonth: _expiryMonthController.text,
            expiryYear: _expiryYearController.text,
            cvv: _cvvController.text,
            holderName: _holderNameController.text,
            addressLine1: _addressLine1Controller.text,
            addressLine2: _addressLine2Controller.text,
            state: _stateController.text,
            zipCode: _zipCodeController.text,
            currency: _currency.code,
            type: _cardType,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add card')),
      body: BlocConsumer<AddCardBloc, AddCardState>(
        listener: (BuildContext context, AddCardState state) {
          if (state is AddCardSuccess) {
            Navigator.of(context).pop(true);
          }
          if (state is AddCardFailure) {
            _formKey.currentState?.validate();
          }
        },
        builder: (BuildContext context, AddCardState state) {
          final bool isLoading = state is AddCardSubmitting;
          final AddCardBloc bloc = context.read<AddCardBloc>();
          final String brand = _brandFromDigits(
            _cardNumberController.text.replaceAll(RegExp(r'\D'), ''),
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (state is AddCardFailure &&
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
                    controller: _cardNumberController,
                    decoration: InputDecoration(
                      labelText: 'Card number',
                      prefixIcon: const Icon(Icons.credit_card),
                      errorText: bloc.fieldErrors['cardNumber'],
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19),
                    ],
                    enabled: !isLoading,
                    onChanged: (_) => setState(() {}),
                    validator: CreateCardRequest.validateCardNumberField,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _expiryMonthController,
                          decoration: InputDecoration(
                            labelText: 'MM',
                            errorText: bloc.fieldErrors['expiry'],
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                          ],
                          enabled: !isLoading,
                          validator: (_) => CreateCardRequest.validateExpiryField(
                            _expiryMonthController.text,
                            _expiryYearController.text,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _expiryYearController,
                          decoration: const InputDecoration(labelText: 'YY'),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          enabled: !isLoading,
                          validator: (_) => null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _cvvController,
                          decoration: InputDecoration(
                            labelText: 'CVV',
                            errorText: bloc.fieldErrors['cvv'],
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(
                              brand == 'Amex' ? 4 : 3,
                            ),
                          ],
                          enabled: !isLoading,
                          validator: (String? value) =>
                              CreateCardRequest.validateCvvField(value, brand),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _holderNameController,
                    decoration: InputDecoration(
                      labelText: 'Cardholder name',
                      prefixIcon: const Icon(Icons.person_outline),
                      errorText: bloc.fieldErrors['holderName'],
                    ),
                    textCapitalization: TextCapitalization.words,
                    enabled: !isLoading,
                    validator: CreateCardRequest.validateHolderNameField,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _addressLine1Controller,
                    decoration: InputDecoration(
                      labelText: 'Address line 1',
                      prefixIcon: const Icon(Icons.home_outlined),
                      errorText: bloc.fieldErrors['addressLine1'],
                    ),
                    enabled: !isLoading,
                    validator: CreateCardRequest.validateAddressLine1Field,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _addressLine2Controller,
                    decoration: InputDecoration(
                      labelText: 'Address line 2 (optional)',
                      errorText: bloc.fieldErrors['addressLine2'],
                    ),
                    enabled: !isLoading,
                    validator: CreateCardRequest.validateAddressLine2Field,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _stateController,
                          decoration: InputDecoration(
                            labelText: 'State',
                            errorText: bloc.fieldErrors['state'],
                          ),
                          textCapitalization: TextCapitalization.characters,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]')),
                          ],
                          enabled: !isLoading,
                          validator: CreateCardRequest.validateStateField,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _zipCodeController,
                          decoration: InputDecoration(
                            labelText: 'ZIP code',
                            errorText: bloc.fieldErrors['zipCode'],
                          ),
                          keyboardType: TextInputType.number,
                          enabled: !isLoading,
                          validator: CreateCardRequest.validateZipCodeField,
                        ),
                      ),
                    ],
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
                          (SupportedCurrency c) => DropdownMenuItem<SupportedCurrency>(
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
                    value: _cardType,
                    decoration: InputDecoration(
                      labelText: 'Card type',
                      errorText: bloc.fieldErrors['type'],
                    ),
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(value: 'debit', child: Text('Debit')),
                      DropdownMenuItem<String>(
                        value: 'credit',
                        child: Text('Credit'),
                      ),
                    ],
                    onChanged: isLoading
                        ? null
                        : (String? value) {
                            if (value != null) {
                              setState(() => _cardType = value);
                            }
                          },
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
                        : const Text('Add card'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _brandFromDigits(String digits) {
    if (digits.isEmpty) {
      return 'Unknown';
    }
    if (digits.startsWith('4')) {
      return 'Visa';
    }
    if (RegExp(r'^3[47]').hasMatch(digits)) {
      return 'Amex';
    }
    if (RegExp(r'^5[1-5]').hasMatch(digits)) {
      return 'Mastercard';
    }
    return 'Unknown';
  }
}
