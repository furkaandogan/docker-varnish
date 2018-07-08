vcl 4.0;

# isteğin ineceği serverın bilgisi
backend default {
    .host = "192.168.1.2";
    .port = "5000";
}

# request cacheden yada serverdan cevap verme işlemlerine karar verilecek yer
sub vcl_recv {
    if ( req.http.cookie ~ "logined" ) {
        return (pass);
    }
    if(req.method=="GET"){
	    return (hash);
    }
    if(req.method=="POST"){
        return (pass);
    }
    if(req.method=="PURGE"){
        return (purge);
    }
	return (hash);
}

# serverdan istek aldıktan sonra response vermeden önce yapılacak işlemlerin yapılacağı yer
sub vcl_backend_response {
    set beresp.ttl = 5d;
    return (deliver);
}

# varnish cachein client a cevap verdiği yer
sub vcl_deliver {
    # to do
}