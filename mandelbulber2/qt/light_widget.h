/*
 * light_widget.h
 *
 *  Created on: 13 mar 2021
 *      Author: krzysztof
 */

#ifndef MANDELBULBER2_QT_LIGHT_WIDGET_H_
#define MANDELBULBER2_QT_LIGHT_WIDGET_H_

#include <QWidget>
#include <memory>

#include "src/algebra.hpp"
#include "src/color_structures.hpp"

class cLightWidget : public QWidget
{
	Q_OBJECT
public:
	cLightWidget(QWidget *parent = nullptr);
	~cLightWidget() override;
	void SetLightAngle(CVector3 _angle);
	void SetLightColor(sRGBFloat _color);
	void Render();

private:
	void paintEvent(QPaintEvent *event) override;
	void mousePressEvent(QMouseEvent *event) override;
	void mouseReleaseEvent(QMouseEvent *event) override;
	void mouseMoveEvent(QMouseEvent *event) override;

	CVector3 lightAngle;
	sRGBFloat lightColor;
	std::vector<sRGBA8> image8;
	int size = 0;

	bool draggingInitStarted = false;
	bool draggingStarted = false;
	CVector3 lightAngleBeforeDrag;
	CVector2<int> dragStartPosition;

signals:
	void angleChanged(double alpha, double beta);
};

#endif /* MANDELBULBER2_QT_LIGHT_WIDGET_H_ */