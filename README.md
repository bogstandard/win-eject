Win-Eject
=========

Win-Eject is a binding for DVD and CD drives. It currently only supports Windows and is dependent on VBScript. Inspired by [DiscDrive](https://github.com/brendanashworth/diskdrive) for OSX & Linux.

## Documentation

#### Drives: `function([callback]);`
Argument is of type `Function`. It is always called upon completion. The argument sent to this callback function is an Object listing available drives.

Example usage:
```javascript
var winEject = require('win-eject');

// Get list of drives availiable
winEject.drives(function(drives){
    console.log(drives);
});
```


#### Eject: `function([id/mount], [callback]);`
First argument can be of type `string`. It specifies the mount / ID of the disk drive to eject. If no drive is specified or the string is blank `''` then *all* drives will be opened.

Second argument is of type `Function`. It is always called upon completion. This callback function is optional.

Example usage:
```javascript
// Eject all available disk drives.
// Note lack of callback (optional)
winEject.eject();

```
```javascript
// Eject disk of [drive].
winEject.eject('E:', function() {
	console.log('Disc Drive E: ejected!');
});

```

#### Close: `function([id/mount], [callback]);`
First argument is of type `string`. It specifies the mount / ID of the disk drive to eject. If no drive is specified or the string is blank `''` then *all* drives will be closed.

Second argument is of type `Function`. It is always called upon completion. This callback function is optional.

**Warning: Close is a hacky solution & has smelly code. This is built on a workaround within VBScript to counter a flaw of VBScript. This function will not work on drives which must be manually close (eg. Laptop drives).**

Example usage:
```javascript
// Close all available disk drives.
// Note lack of callback (optional)
winEject.close();
```

```javascript
// Close disk of [drive].
winEject.close('E:', function() {
	console.log('Disc Drive E: close!');
});

```

### Compatibility
Currently, only Windows 7 has been tested and confirmed to work. On going testing is required.