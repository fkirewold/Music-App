import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/bloc/song_bloc/bloc.dart';
import 'package:music_app/bloc/song_bloc/song_event.dart';
import 'package:music_app/bloc/song_bloc/song_state.dart';
import 'package:music_app/gen/assets.gen.dart';
import 'package:music_app/presentations/widgets/container_widget.dart';
import 'package:music_app/presentations/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

@override
  void initState() {
   
    super.initState();
    context.read<SongBloc>().add(FetchSongEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocBuilder<SongBloc,SongState>(
        builder:(context,SongState state)
        {   
     return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Align(
              alignment: Alignment.topRight,
              child: ContainerWidget(
                  hieght: 40,
                  width: 40,
                  shape: BoxShape.circle,
                  color: Colors.white.withAlpha(51),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 15.88,
                  )),
            ),
            SizedBox(
              height: 6,
            ),
            TextWidget(
              text: 'BROWSE',
              color: Colors.white,
              fontSize: 16,
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ContainerWidget(
                    color: Colors.white,
                    hieght: 20.h,
                    width: 40.w,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          Assets.images.musicImage2.path,
                        )),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  ContainerWidget(
                    hieght: 20.h,
                    width: 40.w,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.images.musicImage1.path)),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  ContainerWidget(
                    hieght: 20.h,
                    width: 40.w,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.images.musicImage2.path)),
                    borderRadius: BorderRadius.circular(5),
                  )
                ],
              ),
            ),
            
       (state is SongLoading)?CircularProgressIndicator():(state is SongLoaded)?ListView.builder(
        itemCount: state.songs.length,
        itemBuilder: (context,index){
          return ListTile(
            title:Text(state.songs[index].artist),);
        }):SizedBox()
          ],
        ),
      );
        } 
        
        ) 

    );
  }
}
