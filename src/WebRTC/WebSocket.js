// module WebRTC.WebSocket

exports.send = function(data) {
    return function(ws) {
        return function() {
            ws.send(data);
        };
    };
};

exports.onmessage = function(f) {
    return function(ws) {
        return function() {
            ws.onmessage = function(event) {
                f(event)();
            };
        };
    };
};
