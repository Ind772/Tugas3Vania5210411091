import 'dart:io';
import 'package:tugas_vania_indra/database/migrations/create_customers_table.dart';
import 'package:tugas_vania_indra/database/migrations/create_orderitems_table.dart';
import 'package:tugas_vania_indra/database/migrations/create_orders_table.dart';
import 'package:tugas_vania_indra/database/migrations/create_productnotes_table.dart';
import 'package:tugas_vania_indra/database/migrations/create_products_table.dart';
import 'package:tugas_vania_indra/database/migrations/create_vendors_table.dart';
import 'package:vania/vania.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
    await CreateCustomersTable().up();
    await CreateOrdersTable().up();
    await CreateVendorsTable().up();
    await CreateProductsTable().up();
    await CreateOrderitemsTable().up();
    await CreateProductnotesTable().up();
  }

  dropTables() async {
    await CreateCustomersTable().down();
    await CreateOrdersTable().down();
    await CreateVendorsTable().down();
    await CreateProductsTable().down();
    await CreateOrderitemsTable().down();
    await CreateProductnotesTable().down();
  }
}
