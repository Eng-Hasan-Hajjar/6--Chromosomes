breed [ceells ceell]
breed [chromosomes1 chromosome1]
chromosomes1-own [id]
breed [chromosomes2 chromosome2]
chromosomes2-own [id]
breed [centrioles centriole]
breed [cells cell]
cells-own [num-cromo]
to setup
  clear-all
  create-cells 1 [
    setxy 0 14
    set size sizecell
    set num-cromo 4
    set shape "cell4single"
  ]

end
to setup-arrow
  crt 1 [
    setxy 0 10
    set shape "line"
    set heading 0
    set size 3
  ]
end
to setup-arrowright
  crt 1 [
    setxy -4 2
    set shape "arrowright"
    set heading 0
    set size 3
  ]
end
to setup-arrowleft
  crt 1 [
    setxy 4 2
    set shape "arrowleft"
    set heading 0
    set size 3
  ]
end
to setup-arrowdown [x]
  crt 1 [
    setxy x -6
    set shape "arrowdown"
    set heading 0
    set size 3
  ]
end
;step 1
to create-double-cromo
  setup-arrow
  create-cells 1 [
    setxy 0 6
    set size sizecell
    set num-cromo 8
    set shape "cell8double"
  ]
end
; step 2
to create-double-2-cromo
  create-double-cromo
  setup-arrowright
  setup-arrowleft
  create-cells 1 [
    setxy -5 -2
    set size sizecell
    set num-cromo 2
    set shape "cell2doublen5"
  ]
  create-cells 1 [
    setxy 5 -2
    set size sizecell
    set num-cromo 2
    set shape "cell2doublen5"
  ]
end
; step 3
to create-single-2-cromo
  create-double-2-cromo
  setup-arrowdown -7
  setup-arrowdown 7
  create-cells 1 [
    setxy -12 -10
    set size sizecell
    set num-cromo 2
    set shape "cell2doublen1"
  ]
  create-cells 1 [
    setxy 12 -10
    set size sizecell
    set num-cromo 2
    set shape "cell2doublen1"
  ]
  create-cells 1 [
    setxy -6 -10
    set size sizecell
    set num-cromo 2
    set shape "cell2doublen1"
  ]
  create-cells 1 [
    setxy 6 -10
    set size sizecell
    set num-cromo 2
    set shape "cell2doublen1"
  ]
end



to setup2
  clear-all
  ask patches [ set pcolor 0 ]
  create-ceells 1
  ask ceells [
    set size 33
    set shape "circle"
    set color 87
  ]
  create-chromo
  create-centrioles 1 [
    set size 8
    set shape "cornerleft"
    set color 46
    setxy random 8  random 13
  ]
  create-centrioles 1[
    set size 8
    set shape "cornerright"
    set color 46
    setxy random -8  random -13
  ]

end
to create-chromo
  let j 0
  repeat 2 [
    create-chromosomes1 1 [
      set size 3
      set shape "x"
      set color 105
      setxy 10  8 + j * 3
      set id j
    ]
    set j  j + 1
  ]
  set j 0
  repeat 2 [
    create-chromosomes2 1 [
      set size 3
      set shape "x"
      set color 16
      setxy -10   -1 *( 8 + j * 3)
      set id j
    ]
    set j j + 1
  ]
end

to conect
  setup2
  ask chromosomes1 with [id = 0] [
    repeat 10 [ wait 0.1 set xcor xcor - 1]
    repeat 17 [ wait 0.1 set ycor ycor - 1]
  ]
  ask chromosomes2 with [id = 0] [
    repeat 10 [ wait 0.1 set xcor xcor + 1]
    repeat 17 [ wait 0.1 set ycor ycor + 1]
    ;    set xcor 0
    ;    set ycor 8
  ]
  ask chromosomes1 with [id = 1] [

    repeat 10 [ wait 0.1 set xcor xcor - 1]
    ;
    ;    set ycor 11
  ]
  ask chromosomes2 with [id = 1] [
    repeat 10 [ wait 0.1 set xcor xcor + 1]
    ;    set xcor 0
    ;    set ycor -8
  ]
end

to change
  ask chromosomes1 with [id = 0] [
    set xcor 0
    set ycor 11
    set shape "xabovred"
  ]
  ask chromosomes2 with [id = 0] [
    set xcor 0
    set ycor 7
    set shape "xabovred"
  ]
  ask chromosomes1 with [id = 1] [
    set xcor 0
    set ycor -11
    set shape "xabovred"
  ]
  ask chromosomes2 with [id = 1] [
    set xcor 0
    set ycor -7
    set shape "xabovred"
  ]
end

to setup-divid
  ask centrioles with [shape = "cornerleft"]
  [
    setxy 13 0
    set heading 0
  ]
  ask centrioles with [shape = "cornerright"][
    setxy -13 0
    set heading 0
  ]
  create-turtles 1[
    setxy 8 5
    set shape "line1"
    set size 12
  ]
  create-turtles 1[
    setxy 8 -5
    set shape "line2"
    set size 12
  ]
  create-turtles 1[
    setxy -8 -5
    set shape "line10"
    set size 12
  ]
  create-turtles 1[
    setxy -8 5
    set shape "line20"
    set size 12
  ]
  ask chromosomes1 with [id = 0] [
    set xcor 0
    set ycor 11
    set shape "xabovred"
    repeat 8 [wait 0.1 set xcor xcor + 1]
    repeat 6 [wait 0.1 set ycor ycor - 1]
  ]
  ask chromosomes2 with [id = 0] [
    set xcor 0
    set ycor 7
    set shape "xabovred"
    repeat 8 [wait 0.1 set xcor xcor - 1]
    repeat 4 [wait 0.1 set ycor ycor - 1]
  ]
  ask chromosomes1 with [id = 1] [
    set xcor 0
    set ycor -11
    set shape "xabovred"
    repeat 8 [wait 0.1 set xcor xcor + 1]
    repeat 6 [wait 0.1 set ycor ycor + 1]
  ]
  ask chromosomes2 with [id = 1] [
    set xcor 0
    set ycor -7
    set shape "xabovred"
    repeat 8 [wait 0.1 set xcor xcor - 1]
    repeat 3 [wait 0.1 set ycor ycor + 1]
  ]
  ask turtles with [shape = "line1"][
    setxy 11 2
    set size 6
  ]
  ask turtles with [shape = "line2"][
    setxy 11 -2
    set size 6
  ]
  ask turtles with [shape = "line10"][
    setxy -11 -2
    set size 6
  ]
  ask turtles with [shape = "line20"][
    setxy -11 2
    set size 6
  ]
end
to divid
  clear-all
  create-ceells 1
  [
    set size 16
    set shape "circle"
    set color 87
    setxy 0 8
  ]
  create-ceells 1
  [
    set size 16
    set shape "circle"
    set color 87
    setxy 0 -8
  ]
  create-chromo
  change
end
to divid4

  clear-all
  create-ceells 1
  [
    set size 10
    set shape "circle"
    set color 87
    setxy 10 8
  ]
  crt 1 [
    set shape "g1"
    set size 6
  setxy  8 8
  ]
  crt 1 [
    set shape "g8"
    set size 6
    setxy  10 8
  ]
  create-ceells 1
  [
    set size 10
    set shape "circle"
    set color 87
    setxy 5 -8
  ]
  crt 1 [
    set shape "g7"
    set size 6
    setxy  4 -8
  ]
  crt 1 [
    set shape "g6"
    set size 4
    setxy  2 -8
  ]
  create-ceells 1
  [
    set size 10
    set shape "circle"
    set color 87
    setxy -5 6
  ]
  crt 1 [
    set shape "g7"
    set size 6
    setxy  -4 6
  ]
  crt 1 [
    set shape "g4"
    set size 6
    setxy  -6 8
  ]
  create-ceells 1
  [
    set size 10
    set shape "circle"
    set color 87
    setxy -10 -4
  ]
  crt 1 [
    set shape "g2"
    set size 6
    setxy  -10 -4
  ]
  crt 1 [
    set shape "g1"
    set size 6
    setxy  -8 -4
  ]

  wait 1
  clear-all
  wait 0.5
  setup2
  wait 0.5
  conect
  wait 0.5
  change
  wait 0.5
  setup-divid
  wait 0.5
  divid
  wait 0.5
  setup3
  wait 0.5
  divid42
  wait 0.5



end



to setup3
  divid

  ask chromosomes1 with [id = 0] [
    set xcor 0
    set ycor 11
    set shape "xabovred"
  ]
  ask chromosomes2 with [id = 0] [
    set xcor 0
    set ycor 7
    set shape "xabovred"
  ]
  ask chromosomes1 with [id = 1] [
    set xcor 0
    set ycor -11
    set shape "xabovred"
  ]
  ask chromosomes2 with [id = 1] [
    set xcor 0
    set ycor -7
    set shape "xabovred"
  ]


  create-centrioles 1 [
    set size 4
    set heading 0
    set shape "cornerleft"
    set color 46
    setxy 6  8
  ]
  create-centrioles 1[
    set size 4
    set heading 0
    set shape "cornerright"
    set color 46
    setxy -6  8
  ]

  create-centrioles 1 [
    set size 4
    set heading 0
    set shape "cornerleft"
    set color 46
    setxy 6  -8
  ]
  create-centrioles 1[
    set size 4
    set heading 0
    set shape "cornerright"
    set color 46
    setxy -6  -8
  ]



  ask chromosomes1 with [id = 0] [
    set size 0
  ]
  wait 0.2
  crt 1 [
    set shape "g7"
    set size 2
    setxy  0 15
     repeat 2 [wait 0.1 set xcor xcor + 0.2 ]
  ]
  crt 1 [
    set shape "g6"
    set size 2
    setxy  0 12
     repeat 3 [wait 0.1 set xcor xcor - 1 ]
  ]
  ask chromosomes2 with [id = 0] [
    set size 0
  ]
   wait 0.2
  crt 1 [
    set shape "g7"
    set size 2
    setxy  0 8
     repeat 3 [wait 0.1 set xcor xcor + 1 ]
  ]
  crt 1 [
    set shape "g6"
    set size 2
    setxy  0 5
     repeat 3 [wait 0.1 set xcor xcor - 1 ]
  ]

  ask chromosomes2 with [id = 1] [
    set size 0
  ]
   wait 0.2
  crt 1 [
    set shape "g7"
    set size 2
    setxy  0 -2
     repeat 3 [wait 0.1 set xcor xcor + 1 ]
  ]
  crt 1 [
    set shape "g4"
    set size 2
    setxy  0 -6
     repeat 3 [wait 0.1 set xcor xcor - 1 ]
  ]
  ask chromosomes1 with [id = 1] [
    set size 0
  ]
   wait 0.2
  crt 1 [
    set shape "g2"
    set size 2

    setxy  0 -10
      repeat 3 [wait 0.1 set xcor xcor + 1 ]
  ]
  crt 1 [
    set shape "g1"
    set size 2
    setxy  0 -12
    repeat 3 [wait 0.1 set xcor xcor - 1 ]
  ]


end



to divid42
    clear-all
  create-ceells 1
  [
    set size 10
    set shape "circle"
    set color 87
    setxy 10 8
  ]
  crt 1 [
    set shape "g1"
    set size 6
    setxy  8 8
  ]
  crt 1 [
    set shape "g8"
    set size 6
    setxy  10 8
  ]
  create-ceells 1
  [
    set size 10
    set shape "circle"
    set color 87
    setxy 5 -8
  ]
  crt 1 [
    set shape "g7"
    set size 6
    setxy  4 -8
  ]
  crt 1 [
    set shape "g6"
    set size 4
    setxy  2 -8
  ]
  create-ceells 1
  [
    set size 10
    set shape "circle"
    set color 87
    setxy -5 6
  ]
  crt 1 [
    set shape "g7"
    set size 6
    setxy  -4 6
  ]
  crt 1 [
    set shape "g4"
    set size 6
    setxy  -6 8
  ]
  create-ceells 1
  [
    set size 10
    set shape "circle"
    set color 87
    setxy -10 -4
  ]
  crt 1 [
    set shape "g2"
    set size 6
    setxy  -10 -4
  ]
  crt 1 [
    set shape "g1"
    set size 6
    setxy  -8 -4
  ]


end


@#$#@#$#@
GRAPHICS-WINDOW
187
10
624
448
-1
-1
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

BUTTON
3
69
176
102
تهيئة النموذج الأول
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
112
119
178
152
step 1
create-double-cromo
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
4
32
176
65
sizecell
sizecell
1
6
5.0
1
1
NIL
HORIZONTAL

BUTTON
112
165
178
198
step 2
create-double-2-cromo
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
112
202
178
235
step 3
create-single-2-cromo
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
15
122
105
150
الخطوة الأولى \nمضاعفة الصبغيات
11
0.0
1

TEXTBOX
32
10
182
28
حجم الخلية التوضيحية
11
0.0
1

TEXTBOX
9
167
119
195
   الخطوة الثانية\nالمنصف الأول اختزالي
11
0.0
1

TEXTBOX
6
211
119
239
الخطوة الثالثة\nالمنصف الثاني خيطي
11
0.0
1

TEXTBOX
690
24
1224
76
\n NetLogo  محاكاة أو نموذج للخلايا والكروموسومات. تم إعداد المحاكاة لإنشاء أنواع مختلفة من الخلايا بأعداد متفاوتة من الكروموسومات:
14
0.0
1

BUTTON
7
248
179
281
تهيئة النموذج الثاني
setup2\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
8
282
92
315
تجاذب الأعراس
conect
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
8
318
92
351
تبادل الألوان
change
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
7
354
92
387
تشكل الصبغيات 
setup-divid\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
8
389
92
422
انقسام الخلية
divid\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
142
460
225
493
انقسام الأخير
divid4
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
674
133
1277
329
الانقسام المنصف :\nيحدث الانقسام المنصف في الكائنات الحية التي تتكاثر جنسياً ،حيث تنقسم الخلايا المولدة للأعراس لتكوين الأعراس المذكرة والمؤنثة .\nيتألف الانقسام المنصف من انقسامين متتاليين هما :\n- الانقسام المنصف الأول : ويتكون من:\n1) الدور الأول (الطليعي): فيه يقترب كل صبغي من قرينه وتنتظم الصبغيات مثنى مثنى فتظهر خيوط رباعية .\n2) الدور الثاني (الاستوائي): تتوضع الرباعيات السابقة في المنطقة الاستوائية.\n3) الدور الثالث (الهجرة): ينفصل كل صبغي عن قرينه ويهاجر إلى أحد قطبي الخلية .\n4) الدور الرابع (النهائي): يحدث انقسام سيتوبلاسمي مشكلاً خليتين.\n- الانقسام المنصف الثاني(المتساوي): تتالى فيه الأدوار الأربعة ،فتعطي كل خلية خليتين فتنتج أربع خلايا أحادية الصيغة الصبغية بدءاً من خلية أم.
11
0.0
1

BUTTON
8
425
178
458
كيفية الانقسام الثاني 
setup3
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
8
460
134
493
انتاج الخلايا الأربعة
divid42
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
### متغيرات عالمية:
- `sizecell`: لم يتم تعريف هذا المتغير في الكود المقدم. يُفترض أنه متغير عالمي يُمثل حجم الخلايا.

### الإجراءات:

#### 1. `setup`:
- يقوم بمسح العالم في NetLogo.
- يقوم بإنشاء خلية واحدة بـ 4 كروموسومات (`num-cromo` تُعين إلى 4).
- يحدد الموقع والحجم والشكل للخلية.

#### 2. `setup-arrow`:
- يقوم بإنشاء شكل يشبه السهم يشير إلى الأعلى.

#### 3. `setup-arrowright`:
- يقوم بإنشاء سهم يشير إلى اليمين.

#### 4. `setup-arrowleft`:
- يقوم بإنشاء سهم يشير إلى اليسار.

#### 5. `setup-arrowdown [x]`:
- يقوم بإنشاء سهم يشير إلى الأسفل في الإحداثيات الساقطة المحددة.

#### 6. `create-double-cromo`:
- يستدعي `setup-arrow`.
- يقوم بإنشاء خلية بـ 8 كروموسومات (`num-cromo` تُعين إلى 8).
- يحدد الموقع والحجم والشكل للخلية.

#### 7. `create-double-2-cromo`:
- يستدعي `create-double-cromo`.
- يستدعي `setup-arrowright` و `setup-arrowleft`.
- يقوم بإنشاء خليتين كل منهما بـ 2 كروموسوم، موضوعة على الجانب الأيسر والأيمن للخلية الأولى.

#### 8. `create-single-2-cromo`:
- يستدعي `create-double-2-cromo`.
- يستدعي `setup-arrowdown` مرتين، يقوم بإنشاء سهمين يشيران إلى الأسفل في مواقع مختلفة.
- يقوم بإنشاء أربع خلايا كل منها بـ 2 كروموسوم، موضوعة في نمط.

#### 9. `go`:
- يبدأ المحاكاة.
- يستدعي `setup` و `create-double-cromo` و `setup-arrowright` و `create-double-2-cromo` و `create-single-2-cromo` تتابعيًا مع تأخيرات قصيرة (`wait`).

### أشكال:
- `"cell4single"`, `"cell8double"`, `"cell2doublen5"`, و`"cell2doublen1"` يُفترض أنها أشكال مخصصة لتمثيل أنواع مختلفة من الخلايا.

### تدفق المحاكاة:
1. يتم إعداد خلية واحدة في البداية.
2. يتم إضافة سهم أعلى الخلية.
3. يتم إنشاء خلية بـ 8 كروموسومات وسهمين يشيران إلى اليمين واليسار.
4. يتم التوسع أكثر بإنشاء خلايا بـ 2 كروموسوم وسهمين إضافيين يشيران إلى الأسفل. 

### ملاحظة:
- أوامر `wait` تقوم بإدخال تأخيرات في المحاكاة، ربما لتحسين التصور.




 The simulation is set up to create different types of cells with varying numbers of chromosomes. Here's a step-by-step explanation of the code:

### Global Variables:
- `sizecell`: The variable is not defined in the provided code. It's assumed to be a global variable representing the size of the cells.

### Procedures:

#### 1. `setup`:
- Clears the NetLogo world.
- Creates a single cell with 4 chromosomes (`num-cromo` is set to 4).
- Sets the position, size, and shape of the cell.

#### 2. `setup-arrow`:
- Creates an arrow-like shape pointing upwards.

#### 3. `setup-arrowright`:
- Creates a right-pointing arrow.

#### 4. `setup-arrowleft`:
- Creates a left-pointing arrow.

#### 5. `setup-arrowdown [x]`:
- Creates a downward-pointing arrow at the specified x-coordinate.

#### 6. `create-double-cromo`:
- Calls `setup-arrow`.
- Creates a cell with 8 chromosomes (`num-cromo` is set to 8).
- Sets the position, size, and shape of the cell.

#### 7. `create-double-2-cromo`:
- Calls `create-double-cromo`.
- Calls `setup-arrowright` and `setup-arrowleft`.
- Creates two cells with 2 chromosomes each, positioned on the left and right side of the first cell.

#### 8. `create-single-2-cromo`:
- Calls `create-double-2-cromo`.
- Calls `setup-arrowdown` twice, creating downward arrows at different positions.
- Creates four cells with 2 chromosomes each, positioned in a pattern.

#### 9. `go`:
- Initiates the simulation.
- Calls `setup`, `create-double-cromo`, `setup-arrowright`, `create-double-2-cromo`, and `create-single-2-cromo` sequentially with short delays (`wait` commands).

### Shapes:
- `"cell4single"`, `"cell8double"`, `"cell2doublen5"`, and `"cell2doublen1"` are assumed to be custom shapes for representing different types of cells.

### Simulation Flow:
1. Initially sets up a single cell.
2. Adds an arrow above it.
3. Creates a cell with 8 chromosomes and arrows pointing right and left.
4. Further expands by creating cells with 2 chromosomes and additional arrows pointing down.

### Note:
- The `wait` commands introduce delays in the simulation, possibly for better visualization.
- The simulation is somewhat hierarchical, building up complexity in stages.








الكود المقدم يُمثل نموذجًا بسيطًا في لغة NetLogo يقوم بتحاكي عملية الانقسام الخلوي (الانقسام الاختزالي). إليك وصف مختصر لكل جزء من الكود:

1. **`setup2` و `create-chromo` و `setup-patch`:**
   - يقوم `setup2` بإعداد البيئة عند بدء التشغيل، حيث يقوم بتهيئة الخلفية وإنشاء الخلايا والهياكل الخلوية.
   - `create-chromo` يقوم بإنشاء كروموسومات بشكل عشوائي في البيئة.
   - `setup-patch` يقوم بتلوين البيئة بألوان محددة.

2. **`conect`:**
   - يقوم بتوصيل الكروموسومات إلى مواقع معينة على الشاشة.

3. **`change`:**
   - يقوم بتغيير مواقع الكروموسومات وشكلها لتمثيل مرحلة معينة من الانقسام الخلوي.

4. **`setup-divid` و `divid`:**
   - `setup-divid` يُعد البيئة لعملية الانقسام الخلوي بتحديد مواقع للهياكل الخلوية.
   - `divid` يقوم بمحاكاة مرحلة من عملية الانقسام الخلوي حيث يتم إنشاء خليتين جديدتين.

5. **`divid4`:**
   - يقوم بإعداد البيئة لمحاكاة مرحلة متقدمة من الانقسام الخلوي، حيث يتم إنشاء خلايا جديدة بشكل معقد.

تمثل الشكلين "g1" و "g8" وغيرها الهياكل الخلوية ذات الأشكال المختلفة في المراحل المختلفة للانقسام الخلوي. يقوم النموذج بتشكيل هذه الهياكل وتحديث المواقع والأشكال لتمثيل مختلف مراحل الانقسام الخلوي.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

arrowdown
true
0
Polygon -7500403 true true 150 240 150 300 195 255 165 240
Polygon -7500403 true true 150 240 150 300 105 255 135 240
Line -7500403 true 150 0 150 300

arrowleft
false
0
Line -7500403 true 0 0 300 300
Polygon -7500403 true true 240 285 300 300 255 255 240 285
Polygon -7500403 true true 285 240 300 300 255 255 285 240

arrowright
false
0
Line -7500403 true 300 0 0 300
Polygon -7500403 true true 60 285 0 300 45 255 60 285
Polygon -7500403 true true 15 240 0 300 45 255 15 240

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

cell2doublen1
false
0
Circle -1 true false 30 30 240
Circle -13791810 true false 60 45 180
Polygon -16777216 true false 150 75 120 105 135 105 180 60 150 75
Polygon -16777216 true false 150 165 120 195 150 180 180 150 150 165
Polygon -16777216 true false 180 150 165 165 180 165 210 135 180 150
Polygon -16777216 true false 120 105 90 135 105 135 150 90 120 105

cell2doublen5
false
0
Circle -1 true false 30 30 240
Circle -13791810 true false 60 45 180
Polygon -16777216 true false 150 75 120 105 135 105 180 60 150 75
Polygon -16777216 true false 195 165 165 195 195 180 225 150 195 165
Polygon -16777216 true false 150 75 135 60 135 60 165 105 150 75
Polygon -16777216 true false 195 165 180 150 180 165 210 195 195 165

cell4single
false
0
Circle -1 true false 30 30 240
Circle -13791810 true false 60 45 180
Polygon -16777216 true false 150 75 120 105 135 105 180 60 150 75
Polygon -16777216 true false 195 180 165 210 195 195 225 165 195 180
Polygon -16777216 true false 120 150 90 165 105 165 135 150 120 150
Polygon -16777216 true false 180 90 165 135 180 135 180 105 180 105

cell8double
false
0
Circle -1 true false 30 30 240
Circle -13791810 true false 60 45 180
Polygon -16777216 true false 150 75 120 105 135 105 180 60 150 75
Polygon -16777216 true false 195 165 165 195 195 180 225 150 195 165
Polygon -16777216 true false 120 150 90 165 105 165 135 150 120 150
Polygon -16777216 true false 180 90 165 135 180 135 180 105 180 105
Polygon -16777216 true false 150 120 195 105 195 120 165 120 165 120
Polygon -16777216 true false 120 150 105 180 105 165 120 135 120 150
Polygon -16777216 true false 150 75 135 60 135 60 165 105 150 75
Polygon -16777216 true false 195 165 180 150 180 165 210 195 195 165

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cornerleft
true
0
Polygon -1184463 true false 240 30 150 135 165 150 255 45 240 30
Polygon -1184463 true false 165 150 255 240 240 255 150 165 150 135 165 150

cornerright
true
0
Polygon -1184463 true false 60 270 150 165 135 150 45 255 60 270
Polygon -1184463 true false 135 150 30 45 45 30 150 135 150 165 135 150

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

g1
false
0
Polygon -13345367 true false 60 240 150 150 165 150 90 285 60 240
Polygon -2674135 true false 165 150 255 60 225 15 150 150 165 150

g2
false
0
Polygon -13345367 true false 60 240 150 150 165 150 90 285 60 240
Polygon -2674135 true false 165 150 255 60 225 15 150 150 165 150

g3
false
0
Polygon -13345367 true false 45 240 135 150 150 150 75 285 45 240
Polygon -2674135 true false 135 150 45 60 75 15 150 150 135 150

g4
false
0
Polygon -13345367 true false 45 240 135 150 150 150 75 285 45 240
Polygon -2674135 true false 165 150 255 240 225 285 150 150 165 150

g6
false
0
Polygon -13345367 true false 60 45 150 135 150 150 15 75 60 45
Polygon -2674135 true false 165 150 255 240 225 285 150 150 165 150

g7
false
0
Polygon -13345367 true false 255 60 165 150 150 150 225 15 255 60
Polygon -2674135 true false 165 150 255 240 225 285 150 150 165 150

g8
false
0
Polygon -13345367 true false 255 60 165 150 150 150 225 15 255 60
Polygon -2674135 true false 150 150 60 240 90 285 165 150 150 150

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

line1
false
0
Line -7500403 true 0 15 300 300

line10
false
0
Line -7500403 true 0 0 300 225

line2
false
0
Line -7500403 true 0 285 300 0

line20
false
0
Line -7500403 true 0 300 300 90

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

xabovred
false
0
Polygon -13345367 true false 165 150 255 240 225 285 150 150 165 150
Polygon -13345367 true false 45 240 135 150 150 150 75 285 45 240
Polygon -2674135 true false 45 60 135 150 150 150 75 15 45 60
Polygon -2674135 true false 165 150 255 60 225 15 150 150 165 150

xunderblue
false
0
Polygon -2674135 true false 165 150 255 60 225 15 150 150 165 150
Polygon -2674135 true false 45 60 135 150 150 150 75 15 45 60
Polygon -13345367 true false 45 240 135 150 150 150 75 285 45 240
Polygon -13345367 true false 165 150 255 240 225 285 150 150 165 150
@#$#@#$#@
NetLogo 6.3.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
