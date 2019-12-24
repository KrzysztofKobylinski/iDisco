import React from 'react'
import _ from 'lodash'
import { 
	Text, 
	View, 
	Style,
} from '../factories'

import __Routing from '../routing'
Routing = React.createFactory __Routing



export default class Root extends React.Component
	render: ->
		Routing {}
