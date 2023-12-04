trigger AdjustDispatchTime on Order (after update) {
    List<Order> ordersToUpdate = new List<Order>();
    for(Order orderItem : Trigger.old){
        // Check if the Dispatch Time has changed
        if (Trigger.OldMap.get(OrderItem.Id).Dispatch_Time__c != Trigger.NewMap.get(OrderItem.Id).Dispatch_Time__c) {
            // Find additional orders with the same Dispatch Time
            List<Order> matchingOrders = new List<Order>();
            matchingOrders = [SELECT Id, OrderNumber, Dispatch_Time__c FROM Order WHERE Dispatch_Time__c = : orderItem.dispatch_time__c AND Id != :orderItem.Id AND RecordType.DeveloperName = 'Additional_Order'];
            
        // Update the Dispatch Time on the matching orders
        for (Order matchingOrder : matchingOrders) {
            matchingOrder.Dispatch_Time__c = Trigger.newMap.get(OrderItem.Id).Dispatch_Time__c;
            ordersToUpdate.add(matchingOrder);
        }
        System.debug('matchingOrders: ' + matchingOrders + ' orderItem Time : ' + orderItem.Dispatch_Time__c);                
        }
    }
    
    system.debug('ordersToUpdate: ' + ordersToUpdate);
    if(!ordersToUpdate.isEmpty()){
        update ordersToupdate;
    }
}