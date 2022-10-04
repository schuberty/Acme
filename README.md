<h1 align="center">Acme</h1>

<div align="center">

Aplicativo desenvolvido como um teste tendo o objetivo de criar interface e arquitetura de um aplicativo proposto do zero.

![GitHub release (latest by date)](https://img.shields.io/github/v/release/schuberty/Jera-Muvver)
![GitHub last commit](https://img.shields.io/github/last-commit/schuberty/Jera-Muvver?color=yellow)

</div>

# Arquitetura

Aplicativo desenvolvido na versão 3.3.0 do [Flutter](https://flutter.dev) utilizando [BLoC](https://pub.dev/packages/flutter_bloc) e [Provider](https://pub.dev/packages/provider) para gerência de estados e injeção de dependências e  alguns conceitos de [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) como padrão da arquitetura do software.

Outros pacotes que ajudaram durante o desenvolvimento foram:

- [Syncfusion Charts](https://pub.dev/packages/syncfusion_flutter_charts) para widgets de tabelas já prontos;
- [Cached Network Images](https://pub.dev/packages/cached_network_image) para facilitar o carregamento contínuo das imagens; e
- [Shared Preferences](https://pub.dev/packages/shared_preferences) para um salvamento local, fácil e rápido de alguns dados.

# Como Usar o Repositório

Uma prévia do aplicativo pode ser visto no final deste Readme, também uma versão atualizado do aplicativo pode ser baixado na aba de releases do Github, caso deseja rodar localmente a partir da source, siga as instruções abaixo.

Após clona-lo, certifique-se de:

1. Rodar o comando `flutter pub get` para obter os pacotes mencionados no [pubspec.yaml](./pubspec.yaml).
2. Rodar o aplicativo a partir da sua IDE preferida ou com o comando `flutter run`.
   - Para mais performance, utilizar `flutter run --release`.

# Tempo Desenvolvimento

Média do tempo do desenvolvimento dos módulos, testes e outros componentes do aplicativo pode ser observado na tabela abaixo.

| Tarefa                                          | Tempo Médio |
| ----------------------------------------------- | :---------: |
| Pesquisa como implementar lista animada         |   2 hora    |
| Tela principal com módulo dos produtos          |   6 hora    |
| Módulo favoritos e carrinho                     |   6 horas   |
| Módulo dashboard                                |   Meia hora |
| Widgets extras para estados de carregamento     |   2 horas   |
|                                                 |             |
| Tempo requisitos básicos                        |  12.5 horas |
| **Tempo total**                                 |  16.5 horas |

Aplicativo foi testado somente na plataforma Android, não sabendo como pode se comportar em um dispositivos iOS.

<div align="center">

https://user-images.githubusercontent.com/38429464/193708144-2cd05c88-550f-4b52-abd8-60eb51aa75b1.mp4

</div>
