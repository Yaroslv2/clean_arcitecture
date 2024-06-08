# Details

Date : 2024-05-19 23:00:04

Directory /home/onefore/projects/flutter-projects/clean_architecture/lib

Total : 67 files,  1977 codes, 0 comments, 320 blanks, all 2297 lines

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/data/api/model/course_api.dart](/lib/data/api/model/course_api.dart) | Dart | 24 | 0 | 3 | 27 |
| [lib/data/api/model/teacher_api.dart](/lib/data/api/model/teacher_api.dart) | Dart | 2 | 0 | 1 | 3 |
| [lib/data/api/model/user_api.dart](/lib/data/api/model/user_api.dart) | Dart | 30 | 0 | 3 | 33 |
| [lib/data/api/request/logout_body.dart](/lib/data/api/request/logout_body.dart) | Dart | 7 | 0 | 3 | 10 |
| [lib/data/api/request/sign_in_body.dart](/lib/data/api/request/sign_in_body.dart) | Dart | 12 | 0 | 3 | 15 |
| [lib/data/api/request/sign_up_body.dart](/lib/data/api/request/sign_up_body.dart) | Dart | 24 | 0 | 3 | 27 |
| [lib/data/api/response/auth_response.dart](/lib/data/api/response/auth_response.dart) | Dart | 10 | 0 | 3 | 13 |
| [lib/data/api/response/courses_response.dart](/lib/data/api/response/courses_response.dart) | Dart | 14 | 0 | 5 | 19 |
| [lib/data/api/response/my_reposnse.dart](/lib/data/api/response/my_reposnse.dart) | Dart | 24 | 0 | 7 | 31 |
| [lib/data/api/response/user_response.dart](/lib/data/api/response/user_response.dart) | Dart | 6 | 0 | 3 | 9 |
| [lib/data/api/service/auth_service.dart](/lib/data/api/service/auth_service.dart) | Dart | 61 | 0 | 10 | 71 |
| [lib/data/api/service/courses_service.dart](/lib/data/api/service/courses_service.dart) | Dart | 77 | 0 | 8 | 85 |
| [lib/data/api/service/user_service.dart](/lib/data/api/service/user_service.dart) | Dart | 28 | 0 | 5 | 33 |
| [lib/data/api/utils/api_util.dart](/lib/data/api/utils/api_util.dart) | Dart | 16 | 0 | 4 | 20 |
| [lib/data/api/utils/middleware.dart](/lib/data/api/utils/middleware.dart) | Dart | 83 | 0 | 15 | 98 |
| [lib/data/mapper/course_mapper.dart](/lib/data/mapper/course_mapper.dart) | Dart | 21 | 0 | 2 | 23 |
| [lib/data/mapper/user_mapper.dart](/lib/data/mapper/user_mapper.dart) | Dart | 7 | 0 | 1 | 8 |
| [lib/data/repository/auth_repository.dart](/lib/data/repository/auth_repository.dart) | Dart | 56 | 0 | 7 | 63 |
| [lib/data/repository/courses_repository.dart](/lib/data/repository/courses_repository.dart) | Dart | 89 | 0 | 11 | 100 |
| [lib/data/repository/token_repository.dart](/lib/data/repository/token_repository.dart) | Dart | 51 | 0 | 13 | 64 |
| [lib/data/repository/user_repository.dart](/lib/data/repository/user_repository.dart) | Dart | 17 | 0 | 4 | 21 |
| [lib/domain/bloc/auth/auth_bloc.dart](/lib/domain/bloc/auth/auth_bloc.dart) | Dart | 47 | 0 | 7 | 54 |
| [lib/domain/bloc/auth/auth_event.dart](/lib/domain/bloc/auth/auth_event.dart) | Dart | 23 | 0 | 8 | 31 |
| [lib/domain/bloc/auth/auth_state.dart](/lib/domain/bloc/auth/auth_state.dart) | Dart | 26 | 0 | 6 | 32 |
| [lib/domain/bloc/cources_page/courses_page_bloc.dart](/lib/domain/bloc/cources_page/courses_page_bloc.dart) | Dart | 26 | 0 | 5 | 31 |
| [lib/domain/bloc/cources_page/courses_page_event.dart](/lib/domain/bloc/cources_page/courses_page_event.dart) | Dart | 7 | 0 | 3 | 10 |
| [lib/domain/bloc/cources_page/courses_page_state.dart](/lib/domain/bloc/cources_page/courses_page_state.dart) | Dart | 24 | 0 | 6 | 30 |
| [lib/domain/bloc/course_page/course_page_bloc.dart](/lib/domain/bloc/course_page/course_page_bloc.dart) | Dart | 31 | 0 | 5 | 36 |
| [lib/domain/bloc/course_page/course_page_event.dart](/lib/domain/bloc/course_page/course_page_event.dart) | Dart | 7 | 0 | 3 | 10 |
| [lib/domain/bloc/course_page/course_page_state.dart](/lib/domain/bloc/course_page/course_page_state.dart) | Dart | 43 | 0 | 6 | 49 |
| [lib/domain/bloc/nested_page/nested_page_bloc.dart](/lib/domain/bloc/nested_page/nested_page_bloc.dart) | Dart | 28 | 0 | 5 | 33 |
| [lib/domain/bloc/nested_page/nested_page_event.dart](/lib/domain/bloc/nested_page/nested_page_event.dart) | Dart | 11 | 0 | 5 | 16 |
| [lib/domain/bloc/nested_page/nested_page_state.dart](/lib/domain/bloc/nested_page/nested_page_state.dart) | Dart | 24 | 0 | 6 | 30 |
| [lib/domain/bloc/user/user_bloc.dart](/lib/domain/bloc/user/user_bloc.dart) | Dart | 61 | 0 | 11 | 72 |
| [lib/domain/bloc/user/user_event.dart](/lib/domain/bloc/user/user_event.dart) | Dart | 14 | 0 | 7 | 21 |
| [lib/domain/bloc/user/user_state.dart](/lib/domain/bloc/user/user_state.dart) | Dart | 31 | 0 | 6 | 37 |
| [lib/domain/constants/http_backpoints.dart](/lib/domain/constants/http_backpoints.dart) | Dart | 14 | 0 | 1 | 15 |
| [lib/domain/constants/storage_keys.dart](/lib/domain/constants/storage_keys.dart) | Dart | 4 | 0 | 1 | 5 |
| [lib/domain/model/course.dart](/lib/domain/model/course.dart) | Dart | 17 | 0 | 3 | 20 |
| [lib/domain/model/nested.dart](/lib/domain/model/nested.dart) | Dart | 62 | 0 | 6 | 68 |
| [lib/domain/model/role.dart](/lib/domain/model/role.dart) | Dart | 1 | 0 | 1 | 2 |
| [lib/domain/model/teacher.dart](/lib/domain/model/teacher.dart) | Dart | 13 | 0 | 3 | 16 |
| [lib/domain/model/user.dart](/lib/domain/model/user.dart) | Dart | 1 | 0 | 1 | 2 |
| [lib/internal/application.dart](/lib/internal/application.dart) | Dart | 61 | 0 | 4 | 65 |
| [lib/internal/dependencies/module/api_module.dart](/lib/internal/dependencies/module/api_module.dart) | Dart | 8 | 0 | 4 | 12 |
| [lib/internal/dependencies/module/repository_module.dart](/lib/internal/dependencies/module/repository_module.dart) | Dart | 10 | 0 | 2 | 12 |
| [lib/internal/dependencies/module/service_module.dart](/lib/internal/dependencies/module/service_module.dart) | Dart | 17 | 0 | 6 | 23 |
| [lib/internal/markdown_logic.dart](/lib/internal/markdown_logic.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/main.dart](/lib/main.dart) | Dart | 29 | 0 | 2 | 31 |
| [lib/presentation/design/theme.dart](/lib/presentation/design/theme.dart) | Dart | 4 | 0 | 2 | 6 |
| [lib/presentation/pages/account/view/account_page.dart](/lib/presentation/pages/account/view/account_page.dart) | Dart | 18 | 0 | 2 | 20 |
| [lib/presentation/pages/course/view/course_form.dart](/lib/presentation/pages/course/view/course_form.dart) | Dart | 126 | 0 | 14 | 140 |
| [lib/presentation/pages/course/view/course_page.dart](/lib/presentation/pages/course/view/course_page.dart) | Dart | 32 | 0 | 4 | 36 |
| [lib/presentation/pages/course/view/course_tab.dart](/lib/presentation/pages/course/view/course_tab.dart) | Dart | 33 | 0 | 4 | 37 |
| [lib/presentation/pages/courses/view/courses_form.dart](/lib/presentation/pages/courses/view/courses_form.dart) | Dart | 33 | 0 | 3 | 36 |
| [lib/presentation/pages/courses/view/courses_page.dart](/lib/presentation/pages/courses/view/courses_page.dart) | Dart | 17 | 0 | 3 | 20 |
| [lib/presentation/pages/courses/widgets/courses_list_view.dart](/lib/presentation/pages/courses/widgets/courses_list_view.dart) | Dart | 70 | 0 | 5 | 75 |
| [lib/presentation/pages/courses/widgets/falure_widget.dart](/lib/presentation/pages/courses/widgets/falure_widget.dart) | Dart | 14 | 0 | 3 | 17 |
| [lib/presentation/pages/nested/view/info_page.dart](/lib/presentation/pages/nested/view/info_page.dart) | Dart | 38 | 0 | 3 | 41 |
| [lib/presentation/pages/nested/view/lab_page.dart](/lib/presentation/pages/nested/view/lab_page.dart) | Dart | 34 | 0 | 3 | 37 |
| [lib/presentation/pages/nested/view/nested_page.dart](/lib/presentation/pages/nested/view/nested_page.dart) | Dart | 54 | 0 | 6 | 60 |
| [lib/presentation/pages/nested/view/test_page.dart](/lib/presentation/pages/nested/view/test_page.dart) | Dart | 42 | 0 | 3 | 45 |
| [lib/presentation/pages/sign_in/view/sign_in_form.dart](/lib/presentation/pages/sign_in/view/sign_in_form.dart) | Dart | 42 | 0 | 7 | 49 |
| [lib/presentation/pages/sign_in/view/sign_in_page.dart](/lib/presentation/pages/sign_in/view/sign_in_page.dart) | Dart | 32 | 0 | 5 | 37 |
| [lib/presentation/pages/sign_in/widget/submit_button.dart](/lib/presentation/pages/sign_in/widget/submit_button.dart) | Dart | 38 | 0 | 6 | 44 |
| [lib/presentation/widgets/bottom_bar.dart](/lib/presentation/widgets/bottom_bar.dart) | Dart | 37 | 0 | 6 | 43 |
| [lib/presentation/widgets/splash_screen.dart](/lib/presentation/widgets/splash_screen.dart) | Dart | 11 | 0 | 4 | 15 |

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)