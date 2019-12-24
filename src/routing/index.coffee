import React from 'react'
import _ from 'lodash'
import { 
	Text, 
	View, 
	Style,
	Button,
	Icons,
	Easing
} from '../factories'

import { 
	Home, 
	HomeDetails,
	Menu, 
	Restaurant, 
	Tab, 
	Settings 
} from '../factories/screens'


import { createAppContainer } from 'react-navigation';
import { createBottomTabNavigator } from "react-navigation-tabs"

TabNavigator = createBottomTabNavigator
	Home: Home
	Menu: Menu
	Tab: Tab
	Restaurant: Restaurant
	Settings: Settings

export default createAppContainer(TabNavigator)



