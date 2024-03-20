import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    AppSettingsController c = Get.put(AppSettingsController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('App Settings'),
      ),
      bottomSheet: Obx(() => c.isMaintenanceMode.isTrue
          ? const SizedBox()
          : Container(
              height: 60,
              width: double.maxFinite,
              margin: const EdgeInsets.all(20),
              child: FilledButton(
                onPressed: () => Get.back(),
                style: FilledButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: theme.colorScheme.primary),
                child: Text(
                  'Save',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.background,
                  ),
                ),
              ),
            )),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
              height: 60,
              width: double.maxFinite,
              padding: const EdgeInsets.only(right: 5, top: 3, bottom: 3, left: 15),
              decoration: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transfer Rate',
                    style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.background),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 45, top: 12, bottom: 12, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: theme.colorScheme.background,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '92.00',
                            style: theme.textTheme.titleMedium?.copyWith(color: theme.primaryColor),
                          ),
                          TextSpan(
                            text: ' INR',
                            style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.inverseSurface),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Info Message',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),
            ),
          ),
          TextField(
            controller: c.infoMessageController,
            maxLines: 3,
            decoration: InputDecoration(
              filled: true,
              fillColor: theme.colorScheme.secondaryContainer,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              labelText: "Enter",
              alignLabelWithHint: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Wallet Address',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),
            ),
          ),
          TextField(
            controller: c.walletAddressController,
            maxLines: 3,
            decoration: InputDecoration(
              filled: true,
              fillColor: theme.colorScheme.secondaryContainer,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              labelText: "Enter",
              alignLabelWithHint: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Maintenance Mode',
                  style: theme.textTheme.bodyLarge,
                ),
                Obx(() => IconButton.filled(
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: c.isMaintenanceMode.isTrue ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
                        fixedSize: const Size.fromWidth(50),
                      ),
                      onPressed: () => c.isMaintenanceMode.value = !c.isMaintenanceMode.value,
                      icon: Icon(Icons.done, color: theme.colorScheme.background),
                    )),
              ],
            ),
          ),
          Obx(() => Visibility(
                visible: c.isMaintenanceMode.isTrue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Maintenance Message',
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),
                      ),
                    ),
                    TextField(
                      controller: c.maintenanceMessageController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: theme.colorScheme.secondaryContainer,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        labelText: "Enter",
                        alignLabelWithHint: true,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class AppSettingsController extends GetxController {
  TextEditingController infoMessageController = TextEditingController();
  TextEditingController walletAddressController = TextEditingController();
  TextEditingController maintenanceMessageController = TextEditingController();

  RxBool isMaintenanceMode = false.obs;
}
