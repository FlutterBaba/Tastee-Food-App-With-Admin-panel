import 'package:flutter/material.dart';
import 'package:tasteefood/appColors/app_colors.dart';
import 'package:tasteefood/widgets/my_button.dart';

class SecondPart extends StatelessWidget {
  const SecondPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ProductName",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text("\$40"),
              SizedBox(
                width: 20,
              ),
              Text(
                "\$50",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.Kgradient1,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "4.5",
                        style: TextStyle(
                          color: AppColors.KwhiteColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "50 Reviews",
                    style: TextStyle(
                      color: AppColors.Kgradient1,
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
          Text(
            "Description",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Yh Product Bhut Acha hain Is ko buy krle ap ko koi masla hua to hum wapas bhi kr le gy",
            style: TextStyle(),
          ),
          MyButton(
            onPressed: () {},
            text: "Add to Cart",
          ),
        ],
      ),
    );
  }
}
