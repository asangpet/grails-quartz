import org.quartz.Scheduler
import org.quartz.CronTrigger
import org.quartz.Trigger
import org.quartz.JobDetail

class JobManagerController {

    Scheduler quartzScheduler
    def jobManagerService

    def index = {        
        redirect(action: list, params: params)
    }

    def list = {
        ["jobsList":jobManagerService.getAllJobs(), "runningJobs":jobManagerService.getRunningJobs()]
    }

    def pause = {
        if (params.what?.equals("JOB")) {
            quartzScheduler.pauseJob (params.jobName, params.jobGroup)
        } else if (params.what?.equals("TRIGGER")) {
            quartzScheduler.pauseTrigger (params.triggerName, params.triggerGroup)
        }
        redirect(action: list, params: [:])
    }

    def resume = {
        if (params.what?.equals("JOB")) {
            quartzScheduler.resumeJob (params.jobName, params.jobGroup)
        } else if (params.what?.equals("TRIGGER")) {
            println "Resuming Trigger: ${params.triggerName}-${params.triggerGroup}"
            quartzScheduler.resumeTrigger (params.triggerName, params.triggerGroup)
        }
        redirect(action: list, params: [:])
    }
}
