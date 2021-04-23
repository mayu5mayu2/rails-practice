"" "
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
end
" ""
"" "
Controllerとは、ユーザ（ブラウザ）からのリクエストを受け取り、ModelやViewと連携しながら結果をユーザ（ブラウザ）に返す機能のことです。
Controllerにアクション（処理）を追加していきます。
今回は、トップページ（/tasks）にアクセスしたときのアクション（index）を追加します。
Task.allでToDoのタスク一覧を取得しています。
" ""
"" "
#Controllerにnewとcreateアクションを追加します。
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
" ""
"" "
newアクションは、タスク追加画面（/tasks/new）にアクセスするときに呼ばれ、
createアクションは、タスク追加するときに呼ばれます。

task_paramsメソッドはStrong Parametersといって、
ユーザから悪意のあるパラメータが渡ってきても安全に処理してくれるものです。
今回は、Taskモデルのtitle（タスク名）パラメータがViewから渡ってきた場合のみタスク追加を行うようにします。

また、privateを使うことで、task_paramsメソッドが外部から使えないようにします。
これもセキュリティを高める設定の1つですね。

tasks_pathの箇所は名前付きルートといい、ルーティングのPrefix名に_pathをつけることで
リンクを表現することができます。tasks_pathはトップ画面（/）へのリンクを表しています。
" ""
"" "
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
" ""
"" "
Controllerにeditとupdateアクションを追加
editアクションは、タスク編集画面（/tasks/:id/edit）にアクセスするときに呼ばれ、
updateアクションは、タスク編集するときに呼ばれます。

ここでいうidとは、Modelを作成したときに自動的に追加される一意な番号を持った項目のことです。
いわゆるテーブルの主キーにあたるものです。例えば、さきほど作成したタスクを編集する場合、タスク編集画面は/tasks/1/editになります。

paramsには、URLやフォームから送られてきた値が格納されています。
params[:id]は送られてきたidの値を表しています。
" ""

# 以下ファイルを編集し、Controllerにdestroyアクションを追加します。
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
