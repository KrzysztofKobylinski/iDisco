import React from 'react'
import _ from 'lodash'
import { 
	Text, 
	View, 
	Style 
} from '../../factories'

export default class Settings extends React.Component
	constructor: (props) ->
		super props
		@state = {}

	render: ->
		Text {}, 
			'Settings'
