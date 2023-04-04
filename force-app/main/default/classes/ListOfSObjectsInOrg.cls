public class ListOfSObjectsInOrg {
    public static List<Object> SObjectInOrg()
    {
        List<Object> listOfSObjects = [select QualifiedApiName from EntityDefinition order by QualifiedApiName];
        system.debug(listOfSObjects);
        return listOfSObjects;
            
     }
}