console.log('start')

Pusher.host = 'slanger1.chain.so'
Pusher.ws_port = 443
Pusher.wss_port = 443

Pusher.log = (msg) ->
    console.log(msg)

SOCHAIN_API_KEY = 'e9f5cc20074501ca7395'

options =
    encryption: true
    disableStats: true
    enabledTransports: [ 'ws' ]
    disabledTransports: ['sockjs']

pusher = new Pusher(SOCHAIN_API_KEY, options)

pusher.connection.bind('state_change', (states) ->
    console.log("State:", states.current)
)

ticker = pusher.subscribe('blockchain_update_doge')

ticker.bind('tx_update', (data) ->
    console.log(data)
    if data.type == "tx"
        unconfirmed_txs = data.value && data.value.unconfirmed_txs
        $('#num-unconfirmed-tx').text(unconfirmed_txs)
)

ticker.bind('block_update', (data) ->
    console.log(data)
    if data.type == "block"
        console.log("data"+data)
)

window.ticker = ticker

