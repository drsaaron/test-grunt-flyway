module.exports = function (grunt) {
    grunt.initConfig({
	flyway: {
	    options: {
		driver: 'com.mysql.jdbc.Driver',
		url: 'jdbc:mysql://s210277:3306/testflyway',
		user: 'aar1069',
		password: 'Fender2'
	    },

	    clean: {
		command: 'clean'
	    },
	    
	    baseline: {
		options: {
		    baselineDescription: 'Sample database created using Flyway:-)',
		    baselineVersion: '1.0'
		},
		command: 'baseline'
	    },
	    migrate: {
		options: {
		    locations: 'filesystem:src/main/resources/db/migration'
		},
		command: 'migrate'
	    }
	}
    })

    // load the flyway tasks
    grunt.loadNpmTasks('grunt-flyway');


}

