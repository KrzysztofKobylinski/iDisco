import React from 'react'
import { 
	Text, 
	View, 
	Style 
} from '../factories'

styles = Style.create({
	base:
		flex: 1
		flexDirection: 'column'
		justifyContent: 'center'
		alignItems: 'center'
	text:
		fontSize: 20
})

export default class Root extends React.Component
	constructor: (props) ->
		super props

	render: ->
		View {style: styles.base},
			Text {style: styles.text}, 
				'iDisco'
