//send client
function send(id,cb){
    var path="/geninfo/v1.0/news/content/n10001/"+id+"?random="+Math.random();
    var options={
        host:"mds.gf.com.cn",
        path:path,
        headers:{
            "Cache-Control":"no-cache",
            "Accept":"*/*",
            "Accept-Encoding":"gzip,deflate,sdch",
            "Accept-Language":"zh-CN;q=0.8,en;q=0.6",
        }
    };
    var beginTime=new Date();
    function end(res){
        var endTime=new Date(); 
        console.log(id+","+(endTime-beginTime)+"ms,"+res.statusCode);
    }
    function callback(res){
        var str="";
        res.on("data",function(chunk){
            str+=chunk;
        });
        res.on("end",function(){
            end(res);
            if(cb) cb();
        });
    };
    var req=http.request(options,callback);
    req.end();
}
