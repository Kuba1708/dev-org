public class retreivingField {
    public List<String> getValue(List<sObject> objects, String fieldToGet){
        List<String> fieldValue = new List<String>();
        for(sObject obj : objects) {
            String fieldToGett = (String)obj.get(fieldToGet);
            fieldValue.add(fieldToGett);
        }
        return fieldValue;
    }
}