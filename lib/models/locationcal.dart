import 'dart:math';
class Locationcal{

  var lat1;
  var lat2;
  var lon1;
  var lon2;


  Locationcal(lat1,lon1,lat2,lon2){
    this.lat1=lat1;
    this.lon1=lon1;
    this.lat2=lat2;
    this.lon2=lon2;
  }

  double calcul()
  {
     var R = 6371e3; // metres
     var phi1 = this.lat1 * pi/180; // φ, λ in radians
     var phi2 = this.lat2 * pi/180;
     var deltaphi = (this.lat2-this.lat1) * pi/180;
    var delatalambda = (this.lon2-this.lon1) * pi/180;

  var a = sin(deltaphi/2) * sin(deltaphi/2) +
  cos(phi1) * cos(phi2) * sin(delatalambda/2) * sin(delatalambda/2);
  var c = 2 * atan2(sqrt(a), sqrt(1-a));

  var d = R * c; // in metres
    return d;
  }
}