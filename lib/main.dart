import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> buttons = [
    {"label": "Profit and Loss", "page": ProfitAndLoss()},
    {"label": "Simple Interest", "page": SimpleInterest()},
    {"label": "Area and Volume", "page": AreaAndVolume()},
    {"label": "Laws of Indices", "page": Indices()},
    {"label": "Coordinates", "page": const Coordinates()},
    {"label": "Statistics", "page": Statistics()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Units'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => buttons[index]['page']));
            },
            child: Card(
              child: Center(
                child: Text(buttons[index]['label']),
              ),
            ),
          );
        },
      ),
      bottomSheet: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: const Text("Developed by Aayush Upreti")),
    );
  }
}

class FormulaWithImage extends StatelessWidget {
  const FormulaWithImage(
      {super.key, required this.svgPath, required this.equation, this.title});

  final String svgPath;
  final String equation;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (title != null)
                Text(title!, style: const TextStyle(fontSize: 20)),
              if (title != null) const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                height: 300,
                width: 300,
                child: SvgPicture.asset(svgPath, height: 250, width: 250),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    (equation.contains(';') && equation.split(';').length == 2)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Math.tex(equation.split(';')[0]),
                              const SizedBox(height: 8),
                              Math.tex(equation.split(';')[1])
                            ],
                          )
                        : Math.tex(
                            equation,
                            textStyle: const TextStyle(fontSize: 16),
                          ),
              ),
            ],
          )),
    );
  }
}

class FormulaList extends StatelessWidget {
  const FormulaList({super.key, required this.equations});

  final List<String> equations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: equations.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Math.tex(
                      equations[index],
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class DescribedFormulaList extends StatelessWidget {
  final List<Map<String, String>> equations;

  const DescribedFormulaList({super.key, required this.equations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: equations.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    equations[index]['description']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Math.tex(
                      equations[index]['equation']!,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}

class ProfitAndLoss extends StatelessWidget {
  final List<Map<String, String>> equations = [
    {
      'equation': r'Profit = SP – CP',
      'description': 'When SP is greater than CP'
    },
    {
      'equation': r'Loss = CP – SP',
      'description': 'When CP is greater than SP'
    },
    {
      'equation': r'Profit\% = \frac{Profit}{CP} \times 100\%',
      'description': 'When CP and Profit are given'
    },
    {
      'equation': r'Loss\% = \frac{Loss}{CP} \times 100\%',
      'description': 'When CP and Loss are given'
    },
    {
      'equation': r'SP = CP(1+\frac{Profit\%}{100})',
      'description': 'When CP and Profit% are given'
    },
    {
      'equation': r'SP = CP(1-\frac{Loss\%}{100})',
      'description': 'When CP and Loss% are given'
    },
    {
      'equation': r'Discount = MP – SP',
      'description': 'When MP and SP are given'
    },
    {
      'equation': r'Discount\% = \frac{Discount}{MP} \times 100\%',
      'description': 'When Discount and MP are given'
    },
    {
      'equation': r'Discount = Discount\% \space of \space MP',
      'description': 'When Discount% and MP are given'
    },
    {
      'equation': r'SP = MP – Discount\% \space of \space MP',
      'description': 'When MP and Discount% are given'
    },
  ];

  ProfitAndLoss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profit and Loss'),
        ),
        body: DescribedFormulaList(equations: equations));
  }
}

class SimpleInterest extends StatelessWidget {
  final List<Map<String, String>> equations = [
    {
      'equation': r'SI = \frac{P \times T \times R}{100}',
      'description': 'When Principal(P), Time(T) and Rate(R) are given'
    },
    {
      'equation': r'Amount = SI + P',
      'description': 'When Simple interest(SI) and Rate(R) are give'
    },
    {
      'equation': r'Amount = P\times(1+\frac{TR}{100})',
      'description': 'When Principal(P), Time(T) and Rate(R) are given'
    },
  ];

  SimpleInterest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Interest')),
      body: DescribedFormulaList(equations: equations),
    );
  }
}

class AreaAndVolume extends StatelessWidget {
  AreaAndVolume({super.key});

  final List<Map<String, String>> equations = [
    {
      "title": "Triangle",
      "equation":
          r"Area = \frac{1}{2} \times b \times h; Perimeter = a + b + c",
      "image": "assets/triangle.svg"
    },
    {
      "title": "Right Angled Triangle",
      "equation":
          r"Area = \frac{1}{2} \times p \times b; Perimeter = p + b + h",
      "image": "assets/right_triangle.svg"
    },
    {
      "title": "Equilateral Triangle",
      "equation": r"Area = \frac{\sqrt{3}}{4} \times a^2; Perimeter = 3a",
      "image": "assets/equilateral.svg"
    },
    {
      "title": "Isosceles Triangle",
      "equation":
          r"Area = \frac{b}{4} \times \sqrt{4a^2 - b^2}; Perimeter = 2a + b",
      "image": "assets/isosceles.svg"
    },
    {
      "title": "Parallelogram",
      "equation": r"Area = b \times h; Perimeter = 2(a + b)",
      "image": "assets/para.svg"
    },
    {
      "title": "Rhombus",
      "equation": r"Area = \frac{1}{2} d_1 \times d_2; Perimeter = 4a",
      "image": "assets/rhom.svg"
    },
    {
      "title": "Quadrilateral",
      "equation":
          r"Area = \frac{1}{2} d (h_1 + h_2); Perimeter = \text{sum of all sides}",
      "image": "assets/quad.svg"
    },
    {
      "title": "Trapezium",
      "equation": r"Area = \frac{1}{2} h (a + b); Perimeter = a + b + c + d",
      "image": "assets/trap.svg"
    },
    {
      "title": "Circle",
      "equation": r"Area = \pi r^2; Circumference = 2 \pi r",
      "image": "assets/circle.svg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Area and Volume')),
        body: SingleChildScrollView(
          child: Column(
            children: equations.map((item) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: FormulaWithImage(
                    svgPath: item['image']!,
                    equation: item['equation']!,
                    title: item['title']!),
              );
            }).toList(),
          ),
        ));
  }
}

class Indices extends StatelessWidget {
  Indices({super.key});

  final List<String> equations = [
    r'x^m \cdot x^n = x^{m+n}',
    r'\frac{x^m}{x^n} = x^{m-n}',
    r'x^0 = 1',
    r'(xy)^m = x^m \cdot y^m',
    r'{\frac {x}{y}}^m = \frac{x^m}{x^n}',
    r'x^m = \frac{1}{x^{-m}}',
    r'{(x^m)}^n = x^{mn}',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Laws of Indices')),
      body: Center(child: FormulaList(equations: equations)),
    );
  }
}

class Coordinates extends StatelessWidget {
  const Coordinates({super.key});

  final String equation = r'Distance = \sqrt{(x_2 - x_1)^2 - (y_2 - y_1)^2}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coordinates')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormulaWithImage(
              svgPath: 'assets/coords.svg',
              equation: equation,
            ),
          ],
        ),
      ),
    );
  }
}

class Statistics extends StatelessWidget {
  Statistics({super.key});

  final List<String> equations = [
    r'\Sigma X = Sum \space of \space all \space values',
    r'\text{Mean}(\bar{X}) = \frac{\Sigma X}{n}',
    r'Median = \left(\frac{n+1}{2}\right)^{\text{th}} \space item',
    r'Mode = Most \space repeated \space value',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: Center(child: FormulaList(equations: equations)),
    );
  }
}
