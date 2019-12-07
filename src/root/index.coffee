import React from 'react'
import _ from 'lodash'
import { 
	Text, 
	View, 
	Style 
} from '../factories'
import { JaDiscoMain } from '../factories/screens'


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

export default class Root extends React.Component
	render: ->
		View {style: styles.base},
			JaDiscoMain {}
