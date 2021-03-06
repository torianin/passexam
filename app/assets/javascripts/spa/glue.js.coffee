#= require YouAreDaBomb
#= require YouAreDaBomb.shortcuts
class @Glue
    constructor:(@useCase, @serverSide,@gui) ->
      After(@useCase, "start", => @gui.showApp())
      After(@useCase, "start", => @gui.showFooter())
      
      After(@useCase, "start", => @useCase.findUsers())
      After(@useCase, "start", => @useCase.findCategories())

      #Data loading
      #users
      After(@useCase, "getUsers", => @serverSide.getUsers())
      After(@serverSide, 'usersLoaded', (users) => @useCase.setUsers(users))

      #categories
      After(@useCase, "getCategories", => @serverSide.getCategories())
      After(@serverSide, 'categoriesLoaded', (categories) => @useCase.setCategories(categories))

      #lists
      After(@useCase, "setCategories", (categories) => @serverSide.getLists(categories))
      After(@serverSide, 'listsLoaded', (lists)  => @useCase.setLists(lists))

      #tasks
      After(@useCase, "setLists", (lists) => @serverSide.getTasks(lists))
      After(@serverSide, 'tasksLoaded', (tasks,id) => @useCase.setTasks(tasks,id))

      #noprogresses
      After(@useCase, "loadNoProgress", => @serverSide.getNoprogresses())
      After(@serverSide, 'noprogressesLoaded', (noprogresses) => @useCase.setNoprogresses(noprogresses))

      #progresses
      After(@useCase, "loadProgress", => @serverSide.getProgresses())
      After(@serverSide, 'progressesLoaded', (progresses) => @useCase.setProgresses(progresses))
      #Data loaded

      After(@gui, "noprogressesShowed", => @useCase.getNoprogresses())
      After(@useCase, "showNoProgress", (noprogresses) => @gui.showTableNoProgress(noprogresses))

      After(@gui, "staticShowed", => @useCase.getProgresses())
      After(@useCase, "showRanking", (tasks_size, ranking) => @gui.showRanking(tasks_size, ranking))
      After(@useCase, "showProgress", 
        (categories, progresses, noprogresses) => @gui.showProgress(categories, progresses, noprogresses))


      After(@gui, "prepareTask", (c,l,t) => @useCase.prepareTask(c,l,t))
      After(@useCase, "showTask", (t,p,n) => @gui.showTask(t,p,n))