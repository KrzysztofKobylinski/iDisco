import React from 'react'
import _ from 'lodash'
import { 
	Text, 
	View, 
	Style 
} from '../factories'
import { StreamInfo } from '../factories/screens'

styles = Style.create({
	base:
		flex: 1
		flexDirection: 'column'
		justifyContent: 'center'
		alignItems: 'center'
		backgroundColor: '#57234e'
	text:
		fontSize: 20
})

ws = new WebSocket 'wss://api.pancernik.info/notifier'

export default class Root extends React.Component

	constructor: (props) ->
		super props
		@state = {}

	componentDidMount: =>
		ws.onmessage = (e, y) =>
			payload = JSON.parse e.data
			if payload.type is 'status'
				@setState
					message: payload.data

	render: ->
		View {style: styles.base},
			if !_.isEmpty @state
				StreamInfo	{...@state.message}
			else
				Text {style: styles.text}, 
					'Loading...'
