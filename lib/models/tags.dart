
class Tags {

  String name = '';
  var friends = new List();
  var hastagged = new List();
  var tagedby = new List();
   Tags(String name,String friend, String hastagged, String taggedby)
  {
    this.name=name;
    friends.add(friend);
    this.hastagged.add(hastagged);
    this.tagedby.add(taggedby);


  }

}