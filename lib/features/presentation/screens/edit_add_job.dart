import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/job_model.dart';
import '../../data/models/jobs_model.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/params/add_job_params.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/image_upload_cubit.dart';
import '../bloc/jobs_cubit.dart';
import '../bloc/requests_states.dart';
import '../widgets/date_time_picker.dart';
import '../widgets/image_picker_helper.dart';

class EditAddJob extends StatefulWidget {
  final int? index;

  EditAddJob({Key? key, this.index}) : super(key: key);

  @override
  State<EditAddJob> createState() => _EditAddJobState();
}

class _EditAddJobState extends State<EditAddJob> {
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  final ImageUploadCubit cubit = ImageUploadCubit();

  int? userId;

  int? jobId;

  String? expirationDate;

  String? imageUrl;

  String? date;
  bool isEditing = false;

  @override
  void initState() {
    isEditing = (widget.index != null);
    userId = ((BlocProvider.of<AuthCubit>(context).state as RequestData).data
            as UserEntity)
        .userId;
    expirationDate = DateTime.now().toString();
    date = DateTime.now().toString();
    if (isEditing) {
      JobModel model =
          ((BlocProvider.of<JobsCubit>(context).state as RequestData).data
                  as JobsModel)
              .jobs[widget.index!] as JobModel;
      jobId = model.jobId;
      expirationDate = model.expirationDate;
      _descController.text = model.description;
      _titleController.text = model.title;
      imageUrl = model.imageUrl;
      date = model.date;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.cancel),
            ),
            IconButton(
              onPressed: () {
                if (isEditing) {
                  if (_descController.text.isEmpty ||
                      _titleController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please fill all the fields"),
                    ));
                  } else {
                    BlocProvider.of<JobsCubit>(context).editJob(
                        JobModel(
                            userId: userId!,
                            jobId: jobId!,
                            expirationDate: expirationDate!,
                            description: _descController.text,
                            title: _titleController.text,
                            imageUrl: imageUrl!,
                            date: date!),
                        widget.index!);
                  }
                } else {
                  if (expirationDate == null ||
                      _descController.text.isEmpty ||
                      _titleController.text.isEmpty ||
                      imageUrl == null ||
                      date == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please fill all the fields"),
                    ));
                  } else {
                    BlocProvider.of<JobsCubit>(context).addJob(AddJobParams(
                        userId: userId!,
                        expirationDate: expirationDate!,
                        description: _descController.text,
                        title: _titleController.text,
                        imageUrl: imageUrl!,
                        date: date!));
                  }
                }
              },
              icon: Icon(Icons.done),
            ),
          ],
          title:
              Text(isEditing ? 'Edit Job Opportunity' : 'Add Job Opportunity')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocListener<JobsCubit, RequestState>(
              bloc: BlocProvider.of<JobsCubit>(context),
              listener: (cx, state) {
                if (state is RequestData) {
                  Navigator.of(context).pop();
                } else if (state is RequestError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)));
                }
              },
              child: Container(),
            ),
            BlocBuilder<ImageUploadCubit, RequestState>(
                bloc: cubit,
                builder: (cx, state) {
                  if (state is RequestData) {
                    imageUrl = state.data.imageUrl;
                  }
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      imageUrl == null
                          ? Container()
                          : Expanded(
                              child: Image.network(
                              imageUrl!,
                            )),
                      SizedBox(
                        width: 20,
                      ),
                      ImagePickerHelper(onSelected: (String path) async {
                        cubit.uploadImage(path);
                      })
                    ],
                  );
                }),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              controller: _descController,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            SizedBox(
              height: 20,
            ),
            DateTimePicker(
                text: "Date:",
                initialDate: isEditing ? DateTime.parse(date!) : null,
                onChanged: (DateTime dateTime) {
                  date = dateTime.toString();
                }),
            SizedBox(
              height: 20,
            ),
            DateTimePicker(
                text: "Expire Date:",
                initialDate: isEditing ? DateTime.parse(expirationDate!) : null,
                onChanged: (DateTime dateTime) {
                  expirationDate = dateTime.toString();
                })
          ],
        ),
      ),
    );
  }
}
