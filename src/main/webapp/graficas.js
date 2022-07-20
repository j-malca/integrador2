new Morris.Line({
  // ID of the element in which to draw the chart.
  element: 'myfirstchart',
  // Chart data records -- each entry in this array corresponds to a point on
  // the chart.
  data: [
    { year: '2020', value: 60 },
    { year : '2021', value: 80 },
    { year: '2022', value: 40 }
  
  
  ],
  // The name of the data record attribute that contains x-values.
  xkey: 'year',
  // A list of names of data record attributes that contain y-values.
  ykeys: ['value'],
  // Labels for the ykeys -- will be displayed when you hover over the
  // chart.
  labels: ['Value']
});

// Use Morris.Bar
Morris.Bar({
  element: 'graph2',
  data: [
    {x: 'CONTABILIDAD', y: 1, z: 2, a: 3},
    {x: 'OPERACIONES', y: 2, z: null, a: 1},
    {x: 'LOGISTICA', y: 0, z: 2, a: 4},
    {x: 'GDH', y: 2, z: 4, a: 3}
  ],
  xkey: 'x',
  ykeys: ['y', 'z', 'a'],
  labels: ['Y', 'Z', 'A']
}).on('click', function(i, row){
  console.log(i, row);
  resize:true;
});

//
var months = ["Ene", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"];

Morris.Line({
  element: 'morris-line-chart',
  data: [{
    m: '2015-01', // <-- valid timestamp strings
    a: 0,
    b: 0
  }, {
    m: '2015-02',
    a: 0,
    b: 0
  }, {
    m: '2015-03',
    a: 0,
    b: 0
  }, {
    m: '2015-04',
    a: 1,
    b: 20
  }, {
    m: '2015-05',
    a: 5,
    b: 30
  }, {
    m: '2015-06',
    a: 10,
    b: 40
  }, {
    m: '2015-07',
    a: 11,
    b: 39
  }, {
    m: '2015-08',
    a: 0,
    b: 0
  }, {
    m: '2015-09',
    a: 0,
    b: 0
  }, {
    m: '2015-10',
    a: 0,
    b: 0
  }, {
    m: '2015-11',
    a: 0,
    b: 0
  }, {
    m: '2015-12',
    a: 0,
    b: 0
  }, ],
  xkey: 'm',
  ykeys: ['a', 'b'],
  labels: ['2020', '2021'],
  xLabelFormat: function(x) { // <--- x.getMonth() returns valid index
    var month = months[x.getMonth()];
    return month;
  },
  dateFormat: function(x) {
    var month = months[new Date(x).getMonth()];
    return month;
  },
});