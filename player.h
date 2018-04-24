#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QMediaPlayer>

class Player : public QObject
{
    Q_OBJECT
public:
    explicit Player(QObject *parent = nullptr);

signals:

public slots:
    void playSL(QString);

private slots:
    void positionChanged(qint64);
    void durationChanged(qint64);
private:
    QMediaPlayer m_player;
    int m_currentTotalTime;
};

#endif // PLAYER_H
