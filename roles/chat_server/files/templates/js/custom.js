document.addEventListener('DOMContentLoaded', function() {
    $('#spinner').hide()
});


async function create_room() {
    $('#spinner').show()
    document.getElementById("newroom");
    var room_type_private = document.getElementById('room_type_private').checked;
    if (room_type_private == true) {
        let response = await fetch('https://{{ my_fqdn }}/app/create_private');
        let responseText = await getTextFromStream(response.body);
        $('#spinner').hide()
        document.getElementById("room_info").innerHTML = responseText;
    } else {
        let response = await fetch('https://{{ my_fqdn }}/app/create_public');
        let responseText = await getTextFromStream(response.body);
        $('#spinner').hide()
        document.getElementById("room_info").innerHTML = responseText;
    }
}

async function getTextFromStream(readableStream) {
    let reader = readableStream.getReader();
    let utf8Decoder = new TextDecoder();
    let nextChunk;
    let resultStr = '';
    while (!(nextChunk = await reader.read()).done) {
        let partialData = nextChunk.value;
        resultStr += utf8Decoder.decode(partialData);
    }
    return resultStr;
}

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('newroom')
        .addEventListener('click', create_room);
});
