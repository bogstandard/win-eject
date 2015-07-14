var winEject = require('./win-eject');

winEject.drives(function(drives){
    
    console.log(drives); // List the drives available
    
    Object.keys(drives).forEach(function(key){ // loop through them individually
        console.log('Opening',key,'...'); // declare what we're going to do..
        
        winEject.eject(key,function(){
            console.log('opened',key);
            }); // open drive in focus individually
        
    });
    
    //  winEject.open(); // would do the same as above but all drives at once.
    
});

setTimeout(function() {
    
        winEject.close('',function(){
            console.log('closed all');
            }); // close all drives after 9 seconds
        
        //  winEject.close('E:'); // would just close E: with no callback.
        
}, 9000);