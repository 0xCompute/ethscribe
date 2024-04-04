# (Build Your Own) Ethscriptions Indexer Notes


##  ethscriptions.com (Indexer) Quirks


### "non-standard" utf8 extension for data encoding

most text inscribe do NOT use percent-encode (encode_uri_component)
but paste / add the raw utf8 string ( % as % and \n as \n and space as space 
and so on)

some (very few) inscribes use the "non-standard" utf8 extension
to mark this technique e.g. 

     data:text/plain;utf8,Hello, World!  

web standard would be to use percent-encode e.g.:

     data:text/plain,Hello%2C%20World%21   # or text/plain the default
     data:,Hello%2C%20World%21


note: the current ethscriptions.com indexer ALWAYS uses 
the "non-standard" utf8 extension (with or without extension in datauri)
and NEVER percent-encodes/decodes
thus - all percent-encoded data_uris are BROKEN! - 
that is, all %xx stay "verbatim" in the text.


> Without ";base64", the data (as a sequence of octets) is represented 
> using ASCII encoding for octets inside the range of safe URL characters 
> and using the standard %xx hex encoding of URLs for octets outside that range.
>
> -- https://www.rfc-editor.org/rfc/rfc2397#section-2 - data uri spec




### mistyped mimetypes

- plain/text   instead of text/plain
- image/jpg    instead of image/jpeg


more quirks
- plain/text;   - parameter separator but no parameters


svg
- unifiy   image/svg  and image/svg+xml  - why? why not?

upcase  - auto downcase content type - why? why not?
TEXT/PLAIN   - is valid 
IMAGE/PNG    - is valid 



### invalid mimetypes accepted

"EthscriptionsApe0000;image/png"=>1,
"EthscriptionsApe3332;image/png"=>1,
 


### datauris - uri encoding/decoding

- text with unencoded newline (`\n`)  - should idealy use %0A ??
example:
- inscribe no.   trailing newline



### protocols

- how to identify protocol text messages (using json)

- allow no mimetype  if starting with `{`
- allow plain/text mimetype (and variants) if starting with `{`
- allow application/json
- others?  - why? why not?

- [ ]  add a new protocol score to model (do NOT use text for queries!!!)





### Appendix

mimetype usage in sub100k (via escriptions.com)

```
{"text/plain"=>77513,
 nil=>13343,
 "image/png"=>6145,
 "image/jpeg"=>2712,
 "image/gif"=>156,
 "application/pdf"=>36,
 "image/webp"=>22,
 "image/svg+xml"=>19,
 "plain/text;"=>13,
 "application/json"=>9,
 "image/svg"=>7,
 "text/html"=>7,
 "image/svg+xml;utf8"=>4,
 "audio/ogg"=>2,
 "image/bmp"=>2,
 "EthscriptionsApe0000;image/png"=>1,
 "EthscriptionsApe3332;image/png"=>1,
 "IMAGE/PNG"=>1,
 "audio/flac"=>1,
 "audio/mpeg"=>1,
 "audio/wav"=>1,
 "dadabots/was+here"=>1,
 "image/jpg"=>1,
 "text/html;"=>1,
 "text/plain;utf8"=>1}
```



and mimetype usage in first 1.5 million (via escriptions.com)

```
{"text/plain"=>1281621,
 "application/json"=>98970,
 "image/png"=>97331,
 "image/svg+xml"=>44345,
 nil=>38402,
 "application/json;{\"p\":\"esc-20\""=>18261,
 "application/json;"=>5906,
 "image/webp"=>4998,
 "image/jpeg"=>4138,
 "text/html"=>3209,
 "application/vnd.esc.contract.call+json"=>2512,
 "image/gif"=>1554,
 "application/vnd.esc.user.profile+json"=>417,
 "image/jpg"=>344,
 "Application/json;data:"=>94,
 "application/vnd.esc.contract.deploy+json"=>51,
 "application/json;{\"p\":\"esc-721\""=>46,
 "application/json;{\"p\":\"erc-20\""=>38,
 "application/pdf"=>37,
 "Application/json"=>20,
 "Application/json;data:Application/json;data:"=>20,
 "image/x-icon"=>19,
 "application/json{\"p\":\"ecc-20\""=>18,
 "application/vnd.esc"=>18,
 "data:text/plain"=>14,
 "plain/text;"=>13,
 "application/json;{\"p\":\"uerc-20\""=>10,
 "text/javascript"=>9,
 "image/svg"=>8,
 "audio/wav"=>7,
 "application/x-javascript"=>6,
 "application/jsonjson"=>5,
 "image/svg+xml;utf8"=>5,
 "audio/ogg"=>4,
 "image/html"=>4,
 "Application/JSON"=>3,
 "Application/json;data:application/json"=>3,
 "application/content:10321"=>3,
 "application/json{\"p\":\"esc-20\""=>3,
 "image/bmp"=>3,
 "text/markdown"=>3,
 "application/content:13205"=>2,
 "application/json:"=>2,
 "application/json;{\"p\":\"terc-20\""=>2,
 "application/vnd.esc.wgw.blue.likes.0x682eb5d577e5b1253eb4629612b614e8941d3bfa8b6aa898d6e37ec5babe055a"=>2,
 "application/vnd.esc.wgw.blue.likes.0x84ae5a3e81d1043360f04d6a3627d3622b31395530783fcde888f29cd33d49d6+json"=>2,
 "application/vnd.esc.wgw.blue.likes.0x9bd27cb8108d51bfa78f9265c5016ccdbdd8b3244c7849ee604d56e64de14d77+json"=>2,
 "application/vnd.esc.wgw.blue.likes.0xad718e7abc8b73fbd385db340bdffabaa62a2636e28a2ce17b371c25ce6fa550+json"=>2,
 "audio/mpeg"=>2,
 "content/hash"=>2,
 "image/avif"=>2,
 "video/mp4"=>2,
 " Application/JSON"=>1,
 " application / json;"=>1,
 "@file/x-dosexec"=>1,
 "Application/json;{\"p\":\"esc-20\""=>1,
 "EthscriptionsApe0000;image/png"=>1,
 "EthscriptionsApe0001;image/png"=>1,
 "EthscriptionsApe0002;image/png"=>1,
 "EthscriptionsApe0003;image/png"=>1,
 "EthscriptionsApe0004;image/png"=>1,
 "EthscriptionsApe0005;image/png"=>1,
 "EthscriptionsApe0006;image/png"=>1,
 "EthscriptionsApe0007;image/png"=>1,
 "EthscriptionsApe0008;image/png"=>1,
 "EthscriptionsApe0009;image/png"=>1,
 "EthscriptionsApe3332;image/png"=>1,
 "IMAGE/PNG"=>1,
 "app/jsonÿ\ewhat fuck ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? {\"p\":\"esc-20\""=>
  1,
 "app/jsonÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001Fÿ\u001F!aaaaaÿ\u001Fÿ\u001Fÿ\u001F{\"p\":\"esc-20\""=>
  1,
 "application/content:12615"=>1,
 "application/json;base64{\"p\":\"esc-721\""=>1,
 "application/json;{\"iv\":\"ecc9a3f72fb6a508bac692e0a963a996\""=>1,
 "application/json;{\"p\":\"ens\""=>1,
 "application/json;{\"p\":\"esc20\""=>1,
 "application/nes"=>1,
 "application/octet-stream"=>1,
 "application/vnd.esc.ethrarities+json"=>1,
 "application/vnd.esc.wgw.blue.likes.0x07c7f81ae0ecd98c0b0cb2531140c93e3c97e39aaeeac8a9622eaa4b9a1898d0+json"=>1,
 "application/vnd.esc.wgw.blue.likes.0x1192f929604f7adda9f95a68941ed1b6addb5d30e93dae252eff0f8b27c9ddbc+json"=>1,
 "application/vnd.esc.wgw.blue.likes.0x194c9e38cce340b74d046ed6475167da1df2bad4fce934726139d743f2a100cb"=>1,
 "application/vnd.esc.wgw.blue.likes.0x34e13b4982f8f30832da3a6a26f2fd615b412c8c905176b03ba97ab57ad4dddf+json"=>1,
 "application/vnd.esc.wgw.blue.likes.0x44d6cc720fd08462b55205ebdc964d4056d3ef98b2fca1ebd15083dd65e23e50"=>1,
 "application/vnd.esc.wgw.blue.likes.0x4619d8ac59dbaa75a166a227cb3537376ad173b448a6529827ed7a2ad87cdd24+json"=>1,
 "application/vnd.esc.wgw.blue.likes.0x682e...055a+json"=>1,
 "application/vnd.esc.wgw.blue.likes.0x682eb5d577e5b1253eb4629612b614e8941d3bfa8b6aa898d6e37ec5babe055a+json"=>1,
 "application/vnd.esc.wgw.blue.likes.0x901adea69de589a0a60d67bd3bf2aa5e6ac0026ec9ff4a0e480a2da6fb3c6d37+json"=>1,
 "application/vnd.esc.wgw.blue.likes.0xab64b73e74b42d7c54e2e66bfbe365a779ebeca0ec91e44e6a33380693c103fe"=>1,
 "application/vnd.esc.wgw.blue.likes.0xc84ff4eb79b088d6a9d07f3433679ba672d98d9a42e799ec2fd4bb09ff6b8a6a+json"=>1,
 "application/vnd.esc.wgw.blue.likes.0xf61d41cad44ef057a4115abaf0e5020fd79c9d50745a7e0f8f368da070ca2b86+json"=>1,
 "application/vnd.esc.wilderness.plot+json"=>1,
 "application/vnd.foo-bar.qux+json"=>1,
 "application/xml"=>1,
 "audio/flac"=>1,
 "content/address"=>1,
 "dadabots/was+here"=>1,
 "image/octet-stream"=>1,
 "image/png;base66"=>1,
 "image/png;base98"=>1,
 "image/svg xml"=>1,
 "image/svg-xml"=>1,
 "image/x-xpmi"=>1,
 "text/css"=>1,
 "text/csv"=>1,
 "text/html;"=>1,
 "text/plain;utf8"=>1,
 "text/png;base64 "=>1,
 "text/svg"=>1}
```

