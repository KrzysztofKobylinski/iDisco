import React from 'react'
import _ from 'lodash'
import moment from 'moment-mini'

import { 
	Text, 
	View, 
	Style,
	Link
} from '../../factories'

styles = Style.create({
	streamInfo: 
		backgroundColor: 'black'
		padding: 20
		borderRadius: 30
	section:
		flexDirection: 'column'
		alignItems: 'center'
		marginVertical: 30
	horizontal: 
		flexDirection: 'row'
		justifyContent: 'space-evenly'
	header: 
		fontWeight: '600'
		fontSize: 25
		color: 'grey'
		marginBottom: 5
	text:
		fontSize: 20
		color: 'white'
		maxWidth: 300
})

export default class StreamInfo extends React.Component
	constructor: (props) ->
		super props

	getLink: ({name, id}) ->
		if name is 'facebook'
			"https://pl-pl.facebook.com#{id}"

	getStreamInfo: =>
		{ stream, streamers} = @props
		{ status, viewers, services, online_at, offline_at} = stream
		if !status
			{}
		else
			currStream = _.find services, {status: false}
			streamer: (_.find streamers, {id: currStream.streamer_id}).name
			link: @getLink currStream
			viewers: viewers
	render: ->
		{ stream, topic} = @props
		{ streamer, link, viewers } = @getStreamInfo()
		status = stream.status
		View {style: styles.streamInfo},
			View {style: styles.horizontal},
				if status
					View {},
						View {style: styles.section},
							Text {style: styles.header}, 'Streamer'
							Text {style: styles.text}, streamer
				View {style: styles.section},
					Text {style: styles.header}, 'Status'
					Text {style: styles.text}, 
						"#{if status then 'Online' else 'Offline'}"
			if status
				View {style: styles.horizontal},
					View {style: styles.section},
						Text {style: styles.header}, 'Link'
						Text {
							style: styles.text
							onPress: => Link.openURL link
							}, 'click'
					View {style: styles.section},
						Text {style: styles.header}, 'Viewers'
						Text {style: styles.text}, viewers
			View {style: styles.section},
				Text {style: styles.header}, 'Description'
				Text {style: styles.text}, topic.text
			View {style: styles.section},
				Text {style: styles.header}, 'Last Update'
				Text {style: styles.text}, 
					moment(topic.updated_at).format 'HH:MM DD/MM/YYYY'

