AdminConfig =
	name: Config.name
	collections:
		Posts: {
			canedit: true
			color: 'red'
			icon: 'pencil'
			tableColumns: [
				{title: 'Title', data:'_id', render: AdminDashboard.formatters.getTitleWithLink}
				{title: 'User', data:'owner', collection:'Users', render: AdminDashboard.formatters.getUserProfileLink}
				{title: 'Edit', data:'_id', render: AdminDashboard.formatters.edit, sortable: false, width: '5%', class: 'text-center'}
				{title: 'Delete', data:'_id', render: AdminDashboard.formatters.del, sortable: false, width: '5%', class: 'text-center'}
			]
		}
		Comments: {
			color: 'green'
			icon: 'comments'
			auxCollections: ['Posts']
			tableColumns: [
				{title:'Post', data:'doc', name: 'Posts', collection_property:'title', render: AdminDashboard.formatters.getAuxTitleWithLink}
				{label:'User', name:'owner', collection:'Users', render: AdminDashboard.formatters.getUserProfileLink}
				{title: 'View', data:'content', render: AdminDashboard.formatters.openInModal, sortable: false, width: '5%', class: 'text-center'}
				{title: 'Edit', data:'_id', render: AdminDashboard.formatters.edit, sortable: false, width: '5%', class: 'text-center'}
				{title: 'Delete', data:'_id', render: AdminDashboard.formatters.del, sortable: false, width: '5%', class: 'text-center'}
			]
		}
	dashboard:
		homeUrl: '/dashboard'
		autoForm:
			omitFields: ['createdAt', 'updatedAt']

if Meteor.isClient
	window.AdminConfig = AdminConfig
else if Meteor.isServer
	global.AdminConfig = AdminConfig