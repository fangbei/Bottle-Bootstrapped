/*** Javascript Extended Helpers ***/

if (typeof String.prototype.startsWith != 'function') {
  String.prototype.startsWith = function (str){
    return this.slice(0, str.length) == str;
  };
}

if (typeof String.prototype.endsWith != 'function') {
  String.prototype.endsWith = function (str){
    return this.slice(-str.length) == str;
  };
}

//data.substring(0, input.length) === input

function isUndefined( obj ){
	return typeof obj === 'undefined' ? true : false;
};

function defaultIfUndef( obj, _default ){
	/*** Returns a default if the object is undefined ***/
	return obj || _default;
};


function getOrDefault(key,_default) {
	/*** Returns the default if the key does not exist in the object ***/
	if ( key in this ) {
		return this[key];
	} else {
		return _default;
	}
};