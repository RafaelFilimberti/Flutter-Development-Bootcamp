# todoey_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Aqui está a explicação do porquê o listen: false resolveu o erro e o que ele realmente faz:

     onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                Navigator.pop(context);
                
              },

1. O que muda com o listen: false?
   Quando você usa o Provider, ele tem dois modos de operação:

Com listen: true (Padrão): Você está dizendo: "Eu quero o dado E quero que você reconstrua este Widget toda vez que o dado mudar". Isso cria um vínculo (link) eterno entre o Widget e o Model.

Com listen: false: Você está dizendo: "Eu só quero uma referência ao Model para ler algo ou chamar uma função, não precisa me vigiar".

2. Por que o erro acontecia?
   O erro ocorria porque você estava tentando criar esse "vínculo de escuta" (listen: true) dentro de uma função de callback (onPressed).

O Flutter proíbe isso por uma questão de lógica: o método onPressed é disparado uma única vez quando você clica. Se o Provider tentasse "escutar" ali, ele não saberia o que redesenhar, pois o onPressed não é um Widget, é apenas um bloco de código executável.

3. "Como eu consigo ler as informações se não estou ouvindo?"
   Essa é a confusão comum! Escutar (listen) é diferente de Acessar (access).

Mesmo com listen: false, você ainda tem acesso total a todas as variáveis e métodos do TaskData.

Você consegue buscar a lista de tarefas, ler o tamanho dela ou chamar o método addTask.

A única coisa que o listen: false faz é dizer ao Flutter: "Se a lista de tarefas mudar no futuro, não precisa avisar este botão 'Add', porque ele já cumpriu o papel dele".