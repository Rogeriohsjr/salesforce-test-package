public with sharing class ItemListPickListExtend extends VisualEditor.DynamicPickList {
  public override VisualEditor.DataRow getDefaultValue() {
    VisualEditor.DataRow defaultValue = new VisualEditor.DataRow(
      '--select an item--',
      ''
    );
    return defaultValue;
  }

  public override VisualEditor.DynamicPickListRows getValues() {
    VisualEditor.DynamicPickListRows listPickListValues = new VisualEditor.DynamicPickListRows();
    VisualEditor.DataRow defaultValue = new VisualEditor.DataRow(
      '--select an item--',
      ''
    );

    listPickListValues.addRow(new VisualEditor.DataRow('Item 1', 'Item 1'));
    listPickListValues.addRow(new VisualEditor.DataRow('Item 2', 'Item 2'));
    listPickListValues.addRow(new VisualEditor.DataRow('Item 3', 'Item 3'));

    listPickListValues.addRow(defaultValue);

    return listPickListValues;
  }
}
