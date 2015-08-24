// module WebRTC.MediaStream

exports._getUserMedia = function(success) {
    return function(error) {
        return function(constraints) {
            return function() {
                var getUserMedia = navigator.getUserMedia
                    || navigator.webkitGetUserMedia
                    || navigator.mozGetUserMedia;

                return getUserMedia.call(
                    navigator,
                    constraints,
                    function(r) { success(r)(); },
                    function(e) { error(e)(); }
                );
            };
        };
    };
};

exports.createObjectURL = function(blob) {
    return function() {
        return URL.createObjectURL(blob);
    };
};
