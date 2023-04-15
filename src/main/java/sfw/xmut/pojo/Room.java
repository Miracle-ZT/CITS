package sfw.xmut.pojo;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/11 1:21
 **/
public class Room {
    private Integer roomId;
    private String roomName;
    private Integer roomRow;
    private Integer roomCol;
    private String layout;
    private Integer cinemaId;

    public Room() {
    }

    public Room(Integer roomId, String roomName, Integer roomRow, Integer roomCol, String layout, Integer cinemaId) {
        this.roomId = roomId;
        this.roomName = roomName;
        this.roomRow = roomRow;
        this.roomCol = roomCol;
        this.layout = layout;
        this.cinemaId = cinemaId;
    }

    @Override
    public String toString() {
        return "Room{" +
                "roomId=" + roomId +
                ", roomName='" + roomName + '\'' +
                ", roomRow=" + roomRow +
                ", roomCol=" + roomCol +
                ", layout='" + layout + '\'' +
                ", cinemaId=" + cinemaId +
                '}';
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public Integer getRoomRow() {
        return roomRow;
    }

    public void setRoomRow(Integer roomRow) {
        this.roomRow = roomRow;
    }

    public Integer getRoomCol() {
        return roomCol;
    }

    public void setRoomCol(Integer roomCol) {
        this.roomCol = roomCol;
    }

    public String getLayout() {
        return layout;
    }

    public void setLayout(String layout) {
        this.layout = layout;
    }

    public Integer getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Integer cinemaId) {
        this.cinemaId = cinemaId;
    }
}
