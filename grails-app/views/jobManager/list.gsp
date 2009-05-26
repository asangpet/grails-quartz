<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Operation List</title>
</head>
<body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <g:render template="/layouts/navBar"/>
        </div>

<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<br>

<h2>List of Currently executing job</h2>
<table class="results">
    <thead>
        <tr>
        	<th>Trigger</th>
        	<th>Job</th>
        	<th>FireTime</th>
        	<th>Previous fire</th>
        	<th>Next fire</th>
        	<th>isRecovering</th>
        	<th>Refire count</th>        	
        </tr>
    </thead>
    <tbody>
        <g:each in="${runningJobs}" status="i" var="job">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>${job.trigger?.name?.encodeAsHTML()}</td>
                <td>${job.getJobDetail()?.encodeAsHTML()}</td>
                <td>${job.fireTime?.encodeAsHTML()}</td>
                <td>${job.previousFireTime?.encodeAsHTML()}</td>
                <td>${job.nextFireTime?.encodeAsHTML()}</td>
                <td>${job.recovering?.encodeAsHTML()}</td>
                <td>${job.refireCount?.encodeAsHTML()}</td>
            </tr>
        </g:each>
    </tbody>
</table>

<br>
<br>

<h2>List of Job added to Quartz Scheduler</h2>
<table class="results">
    <thead>
        <tr>
            <g:sortableColumn property="job.group" title="Job Group Name"/>
            <g:sortableColumn property="job.name" title="Job Name"/>
            <g:sortableColumn property="job.triggerGroup" title="Trigger Group"/>
            <g:sortableColumn property="job.triggerName" title="Trigger Name"/>
            <g:sortableColumn property="job.status" title="status"/>
            <th>Job Operations</th>
            <th>Trigger Operations</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${jobsList}" status="i" var="job">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>${job.group?.encodeAsHTML()}</td>
                <td>${job.name?.encodeAsHTML()}</td>
                <td>${job.triggerGroup?.encodeAsHTML()}</td>
                <td>${job.triggerName?.encodeAsHTML()}</td>
                <td>${job.status?.encodeAsHTML()}</td>
                <td>
                    <g:link action="pause" params="['what':'JOB', 'jobName':job.name, 'jobGroup':job.group, 'triggerName':job.triggerName, 'triggerGroup':job.triggerGroup]"><img src="${resource(dir: 'images', file: 'silk/control_pause.png')}" border="0px" alt="Pause Job"></g:link>
                    <g:link action="resume" params="['what':'JOB', 'jobName':job.name, 'jobGroup':job.group, 'triggerName':job.triggerName, 'triggerGroup':job.triggerGroup]"><img src="${resource(dir: 'images', file: 'silk/control_play.png')}" border="0px" alt="Resume Job"></g:link>
                </td>
                <td>
                    <g:link action="pause" params="['what':'TRIGGER', 'jobName':job.name, 'jobGroup':job.group, 'triggerName':job.triggerName, 'triggerGroup':job.triggerGroup]"><img src="${resource(dir: 'images', file: 'silk/control_pause.png')}" border="0px" alt="Pause Trigger"></g:link>
                    <g:link action="resume" params="['what':'TRIGGER', 'jobName':job.name, 'jobGroup':job.group, 'triggerName':job.triggerName, 'triggerGroup':job.triggerGroup]"><img src="${resource(dir: 'images', file: 'silk/control_play.png')}" border="0px" alt="Resume Trigger"></g:link>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
</body>
</html>
