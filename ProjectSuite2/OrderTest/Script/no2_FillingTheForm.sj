//function Filling()
//{
//  var file = Files.FileNameByName("TestData.csv");
//  Log.Message("Creating driver");
//  
//  var driver = DDT.CSVDriver(file);
//  var index = 0
//  while(!driver.EOF())
//  {
//      var i = 0;
//      var no = driver.Value(i++);
//      var product = driver.Value(i++);
//      var quantity = driver.Value(i++);
//      var date = driver.Value(i++);
//      var customerName = driver.Value(i++);
//      var street = driver.Value(i++);
//      var state = driver.Value(i++);
//      var city = driver.Value(i++);
//      var zip = driver.Value(i++);
//      var card = driver.Value(i++);
//      var cardNo = driver.Value(i++);
//      var expirationDate = driver.Value(i++);
//
//      fillForm(product, quantity, date, customerName, street, state, city, zip, card, cardNo, expirationDate);
//      CustNameTest(index, customerName);
//      
//      driver.Next();
//      index++; 
//  }
//
//  DDT.CloseDriver(file);
//}
//
//function fillForm( product, quantity, date, customerName, street, state, city, zip, card, cardNo, expirationDate )
//{
//  var  orders;
//  var  orderForm;
//  var  groupBox;
//  var  dateTimePicker;
//  var j = 0;
//
//  orders = Aliases.Orders;
//  orders.MainForm.MainMenu.Click("Orders|New order...");
//  orderForm = orders.OrderForm;
//  groupBox = orderForm.Group;
//  groupBox.ProductNames.ClickItem("ScreenSaver");
//
//  groupBox.Quantity.wValue = quantity;
//  groupBox.Date.wDate = date;
//  groupBox.Customer.wText = customerName;
//  groupBox.Street.wText = street;
//  groupBox.City.wText = city;
//  groupBox.State.wText = state;
//  groupBox.Zip.wText = zip;
//
//  if(card === "Visa")
//  {
//      groupBox.Visa.ClickButton();
//  }
//  else if (card === "MasterCard")  
//  {
//      groupBox.MasterCard.ClickButton();
//  }
//  else if (card === "American Express")  
//  {
//      groupBox.AE.ClickButton();
//  }
//
//  groupBox.CardNo.wText = cardNo;
//  groupBox.ExpDate.wDate = expirationDate; 
//  orderForm.ButtonOK.ClickButton();
//  
//}
//
//  
//function CustNameTest(index, nameToTest)
//
//{ 
//  Aliases.Orders.MainForm.OrdersView.SelectItem(index);
//  Delay(500);
//  if(Aliases.Orders.MainForm.OrdersView.FocusedItem.Text.OleValue != nameToTest)
//  {
//    Log.Error("The property value does not equal the baseline value.", Aliases.Orders.MainForm.OrdersView.FocusedItem.Text.OleValue);
//  }
//  else
//  {
//    Log.Message("OK");        
//  }
//  
//}
//
//  
