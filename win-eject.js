var exec = require('child_process').exec;

function execute(command, callback){
    exec(command, function(error, stdout, stderr){ callback(stdout); });
};

module.exports.drives = function(callback){
    execute("Cscript //nologo node_modules/win-eject/drivehack.vbs",function(json){
            callback(JSON.parse(json));
        });
};
module.exports.eject = function(drive,callback){
    drive = ' '+drive || ''; callback=callback||function(){};
    execute("Cscript //nologo node_modules/win-eject/drivehack.vbs open"+drive,callback);    
};
module.exports.close = function(drive,callback){
    drive = ' '+drive || ''; callback=callback||function(){};
    execute("Cscript //nologo node_modules/win-eject/drivehack.vbs close"+drive,callback);
};