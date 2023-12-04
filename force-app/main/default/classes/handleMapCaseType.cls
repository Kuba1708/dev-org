public class handleMapCaseType {
    public static Map<String, List<Case>> casesByType(List<Case> cases) {
         Map<String, List<Case>> typeToCaseMap = new Map <String,List<Case>>();
         for(Case cas : cases){
            if(cas.Type != null){
            if(typeToCaseMap.containsKey(cas.Type)){
                typeToCaseMap.get(cas.Type).add(cas);
            }else{
                typeToCaseMap.put(cas.Type, new List<Case> {cas});
            }
        }
         }
        system.debug(typeToCaseMap);
        return typeToCaseMap;
    }
}