public with sharing class onlineShop {
    public String shopName = 'Obuwie.pl';
    List<Order> orderList = new List<Order>();
Integer orderItems;
    public void makeAnOrder(List<String> orderedItems){
        orderItems = orderedItems.size();
        Order newOrder = new Order(orderedItems);
        orderList.add(newOrder);
        
    }

    public void listOrders(){
        for (Order order : orderList) {
            System.debug('Order Number: ' + order.orderNumber +', order Items: ' + orderItems + ', and ordered: '  + order.orderedItems);
        }
    }

    
    private class Order{
        Integer orderNumber = Integer.valueof((Math.random() * 100000));
        List<String> orderedItems = new List<String>();

        public Order(List<String> orderedItems ){
            this.orderedItems = orderedItems;
            
        }
    }
}