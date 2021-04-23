"" "
ルーティングとは、ユーザ（ブラウザ）からのリクエストに対して
どのControllerのどのアクションを呼び出すかを設定する機能のことです。
resources :tasksを追加することで、TasksControllerのルーティングが自動生成されます。
" ""

Rails.application.routes.draw do
  resources :tasks
end
